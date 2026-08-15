#include <coldc/io.h>
#include <coldc/string.h>
#include <coldc/vector.h>
#include <coldc/error.h>
#include "state_machine.h"

namespace coldc {
namespace formal_policy {

state_t initialize_state_machine(const char* initial_state, error_t* err) {
    state_t state;
    state.id = str::hash(initial_state);
    state.current = str::dup(initial_state);
    if (state.current == nullptr) {
        return state;
    }
    state.valid = true;
    return state;
}

bool transition_state(state_t& state, const char* new_state, error_t* err) {
    if (!state.valid) {
        return false;
    }
    
    char* new_state_dup = str::dup(new_state);
    if (new_state_dup == nullptr) {
        return false;
    }
    
    free(state.current);
    state.current = new_state_dup;
    state.id = str::hash(new_state);
    return true;
}

bool validate_invariant(const state_t& state, const rule_t& rule, error_t* err) {
    // Simplified invariant validation logic
    if (rule.id != 0 && state.id % 2 == 0) {
        return true;
    }
    return false;
}

void cleanup_state_machine(state_t* state) {
    if (state != nullptr && state->current != nullptr) {
        free(state->current);
        state->current = nullptr;
        state->id = 0;
        state->valid = false;
    }
}

} // namespace formal_policy
} // namespace coldc
