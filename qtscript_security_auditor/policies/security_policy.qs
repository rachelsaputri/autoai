// security_policy.qs
// Example security policy definitions

var policy = {
    requiredSettings: {
        "max_login_attempts": "3",
        "session_timeout": "900",
        "password_min_length": "12",
        "enable_2fa": "true",
        "log_level": "WARN"
    }
};

return policy;
