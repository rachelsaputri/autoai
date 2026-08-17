package com.compliance.aj;

import java.util.List;
import java.util.ArrayList;

public class PolicyEngine {

    private List<ComplianceRule> rules = new ArrayList<>();

    public PolicyEngine() {
        // Initialize default compliance rules
        rules.add(new DataSanitizationRule());
        rules.add(new AccessControlRule());
        rules.add(new EncryptionRule());
    }

    public boolean evaluate(Object target, String methodName, Object[] args) {
        for (ComplianceRule rule : rules) {
            if (!rule.validate(target, methodName, args)) {
                return false;
            }
        }
        return true;
    }

    public void addRule(ComplianceRule rule) {
        rules.add(rule);
    }

    public void removeRule(ComplianceRule rule) {
        rules.remove(rule);
    }
}
