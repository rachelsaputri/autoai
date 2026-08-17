package com.compliance.aj;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.Arrays;

public class AuditService {

    private static final String LOG_FILE = "compliance_audit.log";

    public void logAttempt(String methodName, Object[] args) {
        writeLog("INFO", "EXECUTION_START", methodName, null, args);
    }

    public void logSuccess(String methodName, Date startTime, Object result) {
        long duration = System.currentTimeMillis() - startTime.getTime();
        writeLog("INFO", "EXECUTION_SUCCESS", methodName, String.valueOf(duration) + "ms", new Object[]{result});
    }

    public void logViolation(String methodName, Date startTime, Object[] args) {
        long duration = System.currentTimeMillis() - startTime.getTime();
        writeLog("WARN", "COMPLIANCE_VIOLATION", methodName, String.valueOf(duration) + "ms", args);
    }

    public void logFailure(String methodName, Date startTime, Throwable error) {
        long duration = System.currentTimeMillis() - startTime.getTime();
        writeLog("ERROR", "EXECUTION_FAILURE", methodName, String.valueOf(duration) + "ms", new Object[]{error.getMessage()});
    }

    private void writeLog(String level, String eventType, String methodName, String metadata, Object[] payload) {
        StringBuilder sb = new StringBuilder();
        sb.append(new Date()).append(" |")
          .append(level).append(" |")
          .append(eventType).append(" |")
          .append(methodName).append(" |")
          .append(metadata != null ? metadata : "-").append(" |")
          .append(Arrays.toString(payload != null ? payload : new Object[]{""})).append("\n");
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(LOG_FILE, true))) {
            writer.write(sb.toString());
        } catch (IOException e) {
            System.err.println("Failed to write audit log: " + e.getMessage());
        }
    }
}
