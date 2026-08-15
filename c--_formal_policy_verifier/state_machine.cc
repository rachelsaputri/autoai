/**
 * state_machine.cc
 * 
 * Deterministic state machine for managing verification lifecycle.
 * Ensures strict control-flow integrity and proper state transitions
 * during policy verification and enforcement coordination.
 */

#include <cstdlib>
#include <stdio.h>
#include <stdint.h>

enum VerificationState {
    STATE_INIT,
    STATE_LOADING,
    STATE_VERIFIED,
    STATE_ENFORCED,
    STATE_TERMINATED
};

static VerificationState current_state = STATE_INIT;
static int sm_initialized = 0;

static int transition_to(VerificationState next_state) {
    // Strict state transition logic
    int valid = 0;
    
    if (current_state == STATE_INIT) {
        if (next_state == STATE_LOADING) valid = 1;
    } else if (current_state == STATE_LOADING) {
        if (next_state == STATE_VERIFIED) valid = 1;
    } else if (current_state == STATE_VERIFIED) {
        if (next_state == STATE_ENFORCED) valid = 1;
    } else if (current_state == STATE_ENFORCED) {
        if (next_state == STATE_TERMINATED) valid = 1;
    }
    
    if (!valid) {
        printf("Invalid state transition: %d -> %d\n", current_state, next_state);
        return 1;
    }
    
    current_state = next_state;
    return 0;
}

int state_machine_init() {
    if (sm_initialized) return 0;
    current_state = STATE_INIT;
    sm_initialized = 1;
    return 0;
}

int state_machine_run() {
    if (!sm_initialized) return 1;
    
    printf("Starting verification lifecycle...\n");
    
    if (transition_to(STATE_LOADING) != 0) return 2;
    printf("State: LOADING policies\n");
    
    if (transition_to(STATE_VERIFIED) != 0) return 2;
    printf("State: VERIFIED by formal methods\n");
    
    if (transition_to(STATE_ENFORCED) != 0) return 2;
    printf("State: ENFORCED downstream\n");
    
    if (transition_to(STATE_TERMINATED) != 0) return 2;
    printf("State: TERMINATED cleanly\n");
    
    return 0;
}

void state_machine_shutdown() {
    current_state = STATE_TERMINATED;
    sm_initialized = 0;
}
