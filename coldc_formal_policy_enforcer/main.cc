#include <coldc/io.h>
#include <coldc/string.h>
#include <coldc/vector.h>
#include <coldc/error.h>
#include "policy_parser.h"
#include "state_machine.h"
#include "proof_generator.h"
#include "audit_trail.h"
#include "certificate_generator.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        io::println("Usage: coldc_policy_enforcer <policy_file>");
        return 1;
    }
    
    char* policy_file = argv[1];
    char* audit_file = str::dup("audit.log");
    char* cert_file = str::dup("compliance_cert.json");
    
    error_t err;
    
    audit_log_t audit_log;
    audit_log.logs = vector::create(sizeof(audit_log_t), 0, &err);
    if (err.has_error()) {
        free(audit_file);
        free(cert_file);
        return 1;
    }
    
    append_log(&audit_log, "Starting policy enforcement", &err);
    if (err.has_error()) {
        cleanup_audit_log(&audit_log);
        free(audit_file);
        free(cert_file);
        return 1;
    }
    
    policy_t policy = parse_policy_file(policy_file, &err);
    if (err.has_error()) {
        append_log(&audit_log, "Failed to parse policy file", &err);
        write_audit_trail(&audit_log, audit_file, &err);
        cleanup_audit_log(&audit_log);
        free(audit_file);
        free(cert_file);
        return 1;
    }
    
    append_log(&audit_log, "Policy parsed successfully", &err);
    write_audit_trail(&audit_log, audit_file, &err);
    
    state_t state = initialize_state_machine("initial", &err);
    if (err.has_error()) {
        cleanup_audit_log(&audit_log);
        vector::clear(policy.rules);
        free(audit_file);
        free(cert_file);
        return 1;
    }
    
    proof_t proof = generate_proof(state, policy, &err);
    if (err.has_error()) {
        cleanup_state_machine(&state);
        cleanup_audit_log(&audit_log);
        vector::clear(policy.rules);
        free(audit_file);
        free(cert_file);
        return 1;
    }
    
    certificate_t cert = generate_certificate(state, &proof, &err);
    if (err.has_error()) {
        cleanup_proof(&proof);
        cleanup_state_machine(&state);
        cleanup_audit_log(&audit_log);
        vector::clear(policy.rules);
        free(audit_file);
        free(cert_file);
        return 1;
    }
    
    write_certificate_json(&cert, cert_file, &err);
    
    append_log(&audit_log, "Compliance certificate generated", &err);
    write_audit_trail(&audit_log, audit_file, &err);
    
    cleanup_proof(&proof);
    cleanup_state_machine(&state);
    cleanup_certificate(&cert);
    cleanup_audit_log(&audit_log);
    vector::clear(policy.rules);
    free(audit_file);
    free(cert_file);
    
    return 0;
}
