// main.qs
// QtScript Security Configuration Auditor

import QtQuick 2.0;
import QtScript 2.0;

var CONFIG_PATH = "configs/security.conf";
var POLICY_PATH = "policies/security_policy.qs";
var REPORT_PATH = "reports/audit_report.txt";

function readFileSync(filePath) {
    var file = new File(filePath);
    if (!file.openIODevice(IODevice.ReadOnly | IoDevice.Text)) {
        logError("Failed to open file: " + filePath);
        return "";
    }
    var content = file.readAll();
    file.close();
    return content;
}

function parseConfig(content) {
    var config = {};
    var lines = content.split("\n");
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i].trim();
        if (line.length > 0 && !line.startsWith("#")) {
            var parts = line.split("=");
            if (parts.length === 2) {
                config[parts[0].trim()] = parts[1].trim();
            }
        }
    }
    return config;
}

function loadPolicy() {
    var policyContent = readFileSync(POLICY_PATH);
    var policyScript = new Script();
    policyScript.addCode(policyContent);
    return policyScript; // Returns policy object/functions
}

function validateConfig(config, policy) {
    var violations = [];
    for (var key in config) {
        if (key in policy.requiredSettings) {
            if (config[key] !== policy.requiredSettings[key]) {
                violations.push({setting: key, expected: policy.requiredSettings[key], actual: config[key]});
            }
        }
    }
    return violations;
}

function generateReport(violations) {
    var report = "Security Configuration Audit Report\n";
    report += "====================================\n";
    if (violations.length === 0) {
        report += "Status: COMPLIANT\nNo violations found.\n";
    } else {
        report += "Status: NON-COMPLIANT\nFound " + violations.length + " violation(s):\n\n";
        for (var i = 0; i < violations.length; i++) {
            report += "Violation " + (i+1) + ":\n";
            report += "  Setting: " + violations[i].setting + "\n";
            report += "  Expected: " + violations[i].expected + "\n";
            report += "  Actual: " + violations[i].actual + "\n\n";
        }
    }
    return report;
}

function logError(msg) {
    print("[ERROR] " + msg);
}

function run() {
    print("Starting Security Configuration Auditor...");
    try {
        var configContent = readFileSync(CONFIG_PATH);
        var config = parseConfig(configContent);
        var policy = loadPolicy();
        var violations = validateConfig(config, policy);
        var report = generateReport(violations);
        var reportFile = new File(REPORT_PATH);
        if (reportFile.openIODevice(FileDevice.WriteOnly | FileDevice.Text)) {
            reportFile.writeAll(report);
            reportFile.close();
            print("Report saved to: " + REPORT_PATH);
        } else {
            logError("Failed to write report file.");
        }
        print("Audit complete.");
    } catch (e) {
        logError("Auditor failed: " + e);
    }
}

// Initialize and run
run();
