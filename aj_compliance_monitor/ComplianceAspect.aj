package com.compliance.aj;

import java.util.Date;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class ComplianceAspect {

    private AuditService auditService = new AuditService();
    private PolicyEngine policyEngine = new PolicyEngine();
    private RemediationHandler remediationHandler = new RemediationHandler();

    @Pointcut("execution(* com.enterprise.*..*(..))")
    public void enterpriseMethods() {}

    @Pointcut("execution(* com.enterprise.data.*..*(..))")
    public void dataAccessMethods() {}

    @Around("enterpriseMethods() || dataAccessMethods()")
    public Object monitorAndEnforce(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().toShortString();
        Object[] args = joinPoint.getArgs();
        Date startTime = new Date();
        
        try {
            auditService.logAttempt(methodName, args);
            boolean isCompliant = policyEngine.evaluate(joinPoint.getTarget(), methodName, args);
            
            if (!isCompliant) {
                auditService.logViolation(methodName, startTime, args);
                remediationHandler.triggerViolation(methodName, args);
                throw new SecurityException("Compliance violation detected in " + methodName);
            }
            
            Object result = joinPoint.proceed();
            auditService.logSuccess(methodName, startTime, result);
            return result;
            
        } catch (SecurityException e) {
            throw e;
        } catch (Throwable e) {
            auditService.logFailure(methodName, startTime, e);
            throw e;
        }
    }
}
