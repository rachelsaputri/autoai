# Axiom Macros
# Macros and constants for the formal proof verification engine.

#ifndef AX_MACROS_H
#define AX_MACROS_H

# Macro for Proof Term Types
#define PROOF_TERM_TYPE_AXIOM 1
#define PROOF_TERM_TYPE_THEOREM 2
#define PROOF_TERM_TYPE_LEMMA 3
#define PROOF_TERM_TYPE_COROLLARY 4

# Macro for Constraint Types
#define CONSTRAINT_TYPE_LOGICAL 1
#define CONSTRAINT_TYPE_CRYPTO 2
#define CONSTRAINT_TYPE_POLICY 3
#define CONSTRAINT_TYPE_STATE 4

# Macro for Verification Status
#define VERIFICATION_STATUS_PASSED 1
#define VERIFICATION_STATUS_FAILED 2
#define VERIFICATION_STATUS_PENDING 3

# Macro for Policy Alignment Threshold
#define POLICY_ALIGNMENT_THRESHOLD 0.8

# Macro for Max Retries
#define MAX_RETRIES 3

# Macro for Log Level
#define LOG_LEVEL_DEBUG 0
#define LOG_LEVEL_INFO 1
#define LOG_LEVEL_WARN 2
#define LOG_LEVEL_ERROR 3

#endif # AX_MACROS_H
