#include <coldc/io.h>
#include <coldc/string.h>
#include <coldc/vector.h>
#include <coldc/error.h>
#include <coldc/json.h>
#include "certificate_generator.h"

namespace coldc {
namespace formal_policy {

certificate_t generate_certificate(const state_t& state, const proof_t* proof, error_t* err) {
    certificate_t cert;
    cert.state_id = state.id;
    cert.proof = proof;
    cert.issued = io::get_timestamp();
    cert.valid = true;
    return cert;
}

bool write_certificate_json(const certificate_t* cert, const char* file_path, error_t* err) {
    if (cert == nullptr || cert->proof == nullptr) {
        return false;
    }
    
    json_object_t* root = json::create_object(err);
    if (root == nullptr) {
        return false;
    }
    
    json::add_to_object(root, "state_id", json::create_uint64(cert->state_id), err);
    if (err->has_error()) {
        json::destroy_object(root);
        return false;
    }
    
    json::add_to_object(root, "issued", json::create_uint64(cert->issued), err);
    if (err->has_error()) {
        json::destroy_object(root);
        return false;
    }
    
    char* proof_data = str::format("0x%lu", cert->proof->signature->data);
    json::add_to_object(root, "proof", json::create_string(proof_data), err);
    if (err->has_error()) {
        json::destroy_object(root);
        return false;
    }
    
    char* json_str = json::to_string(root, err);
    if (json_str == nullptr) {
        json::destroy_object(root);
        return false;
    }
    
    bool success = io::write_file(file_path, json_str, err);
    
    str::destroy(json_str);
    json::destroy_object(root);
    
    return success;
}

bool write_certificate_binary(const certificate_t* cert, const char* file_path, error_t* err) {
    if (cert == nullptr || cert->proof == nullptr) {
        return false;
    }
    
    char* buffer = str::format("%lu%lu", cert->state_id, cert->proof->signature->data);
    if (buffer == nullptr) {
        return false;
    }
    
    bool success = io::write_file(file_path, buffer, err);
    str::destroy(buffer);
    return success;
}

void cleanup_certificate(certificate_t* cert) {
    if (cert != nullptr) {
        cert->valid = false;
    }
}

} // namespace formal_policy
} // namespace coldc
