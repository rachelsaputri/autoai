package com.compliance.aj;

public interface ComplianceRule {
    boolean validate(Object target, String methodName, Object[] args);
    String getRuleName();
}
