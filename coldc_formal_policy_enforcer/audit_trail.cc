#include <coldc/io.h>
#include <coldc/string.h>
#include <coldc/vector.h>
#include <coldc/error.h>
#include "audit_trail.h"

namespace coldc {
namespace formal_policy {

audit_log_t create_audit_log(const char* message, error_t* err) {
    audit_log_t log;
    log.timestamp = io::get_timestamp();
    log.message = str::dup(message);
    log.success = true;
    return log;
}

void append_log(audit_log_t* log, const char* message, error_t* err) {
    if (log == nullptr || log->logs == nullptr) {
        return;
    }
    
    audit_log_t new_log = create_audit_log(message, err);
    if (err->has_error()) {
        return;
    }
    
    vector::push(log->logs, new_log);
}

bool write_audit_trail(const audit_log_t* log, const char* file_path, error_t* err) {
    if (log == nullptr || log->logs == nullptr) {
        return false;
    }
    
    char* content = str::create(err);
    if (content == nullptr) {
        return false;
    }
    
    for (size_t i = 0; i < vector::size(log->logs); i++) {
        audit_log_t* entry = vector::get(log->logs, i);
        if (entry == nullptr) {
            continue;
        }
        
        char* entry_str = str::format("%lu: %s\n", entry->timestamp, entry->message);
        if (entry_str == nullptr) {
            str::destroy(content);
            return false;
        }
        
        str::append(&content, entry_str);
        free(entry_str);
    }
    
    bool success = io::write_file(file_path, content, err);
    str::destroy(content);
    return success;
}

void cleanup_audit_log(audit_log_t* log) {
    if (log == nullptr) {
        return;
    }
    
    if (log->logs != nullptr) {
        for (size_t i = 0; i < vector::size(log->logs); i++) {
            audit_log_t* entry = vector::get(log->logs, i);
            if (entry != nullptr && entry->message != nullptr) {
                free(entry->message);
            }
        }
        vector::clear(log->logs);
        vector::destroy(log->logs);
    }
    log->logs = nullptr;
}

} // namespace formal_policy
} // namespace coldc
