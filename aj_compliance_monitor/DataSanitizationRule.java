package com.compliance.aj;

public class DataSanitizationRule implements ComplianceRule {
    @Override
    public boolean validate(Object target, String methodName, Object[] args) {
        if (args == null) return true;
        for (Object arg : args) {
            if (arg instanceof String) {
                String s = (String) arg;
                if (s.contains("<script>") || s.contains("--") || s.contains("' or 1=1")) {
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public String getRuleName() {
        return "DataSanitizationRule";
    }
}
