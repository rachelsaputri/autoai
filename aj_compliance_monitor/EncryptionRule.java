package com.compliance.aj;

public class EncryptionRule implements ComplianceRule {
    @Override
    public boolean validate(Object target, String methodName, Object[] args) {
        // Simulate encryption requirement check for PII
        if (methodName.contains("savePatientRecord") || methodName.contains("storeSSN")) {
            // In a real scenario, verify that args contain encrypted data or are handled by an encrypted DAO
            // Here we assume compliance if the method signature exists and args are non-null
            return args != null && args.length > 0;
        }
        return true;
    }

    @Override
    public String getRuleName() {
        return "EncryptionRule";
    }
}
