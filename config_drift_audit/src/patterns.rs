// Patterns for configuration file validation
// This module could contain rules for detecting specific types of configuration changes

pub fn is_sensitive_path(path: &str) -> bool {
    path.contains("private") || 
    path.contains("secret") || 
    path.contains("key")
}

pub fn is_critical_file(path: &str) -> bool {
    path.contains("config") || 
    path.contains("settings") || 
    path.contains("manifest")
}
