#include "drift_detector.h"
#include <algorithm>

std::vector<DriftRecord> DriftDetector::detectDrift(
    const std::map<std::string, ConfigEntry>& baseline,
    const std::map<std::string, ConfigEntry>& target
) {
    std::vector<DriftRecord> drifts;

    for (const auto& [key, base_entry] : baseline) {
        auto it = target.find(key);
        if (it == target.end()) {
            auto record = createDriftRecord(key, base_entry.value, "REMOVED", base_entry.section, base_entry.line_number, "REMOVED");
            record.severity_score = calculateSeverity(key, "REMOVED");
            drifts.push_back(record);
        } else {
            if (it->second.value != base_entry.value) {
                auto record = createDriftRecord(key, base_entry.value, it->second.value, base_entry.section, base_entry.line_number, "MODIFIED");
                record.severity_score = calculateSeverity(key, "MODIFIED");
                drifts.push_back(record);
            }
        }
    }

    for (const auto& [key, target_entry] : target) {
        if (baseline.find(key) == baseline.end()) {
            auto record = createDriftRecord(key, "N/A", target_entry.value, target_entry.section, target_entry.line_number, "ADDED");
            record.severity_score = calculateSeverity(key, "ADDED");
            drifts.push_back(record);
        }
    }

    std::sort(drifts.begin(), drifts.end(), [](const DriftRecord& a, const DriftRecord& b) {
        return a.severity_score > b.severity_score;
    });

    return drifts;
}

DriftRecord DriftDetector::createDriftRecord(
    const std::string& key,
    const std::string& expected,
    const std::string& actual,
    const std::string& section,
    const std::string& line_num,
    const std::string& type
) {
    DriftRecord record;
    record.key = key;
    record.expected_value = expected;
    record.actual_value = actual;
    record.section = section;
    record.line_number = line_num;
    record.drift_type = type;
    return record;
}

double DriftDetector::calculateSeverity(const std::string& key, const std::string& type) {
    double base = 1.0;
    if (type == "MODIFIED") {
        base = 2.0;
    } else if (type == "REMOVED") {
        base = 3.0;
    } else if (type == "ADDED") {
        base = 1.5;
    }

    if (key.find("password") != std::string::npos || key.find("auth") != std::string::npos || key.find("ssl") != std::string::npos) {
        base *= 2.0;
    }

    return base;
}
