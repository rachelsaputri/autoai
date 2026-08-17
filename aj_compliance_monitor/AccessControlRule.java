package com.compliance.aj;

public class AccessControlRule implements ComplianceRule {
    @Override
    public boolean validate(Object target, String methodName, Object[] args) {
        // Simulate role-based access check
        String threadName = Thread.currentThread().getName();
        if (threadName.contains("admin") || threadName.contains("privileged")) {
            return true;
        }
        // Deny access to sensitive methods for unprivileged threads
        if (methodName.contains("transferFunds") || methodName.contains("deleteUser")) {
            return false;
        }
        return true;
    }

    @Override
    public String getRuleName() {
        return "AccessControlRule";
    }
}
