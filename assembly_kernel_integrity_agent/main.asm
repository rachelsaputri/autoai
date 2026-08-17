section .data
    ; Critical configuration constants
    STACK_SIZE  equ 4096
    HASH_SEED   equ 0xDEADBEEF
    MAX_SYSCALL equ 333
    POLICY_LOG  equ 'P'
    ALERT_LOG   equ 'A'

section .bss
    ; Global state variables
    stack_space resb STACK_SIZE
    policy_violations resq 1
    system_state    resq 1
    hash_context    resq 4 ; SHA-256 context

section .text
    global _start
    extern init_idt
    extern syscall_hook
    extern policy_eval
    extern integrity_monitor
    extern log_event

_start:
    ; Initialize system state
    mov rax, 1
    mov [system_state], rax

    ; Set up stack
    lea rsp, [stack_space + STACK_SIZE]
    lea rbp, [stack_space + STACK_SIZE]

    ; Initialize interrupt descriptors and hooks
    call init_idt

    ; Begin policy evaluation and integrity monitoring
    call policy_eval
    call integrity_monitor

    ; Main monitoring loop
.monitor_loop:
    ; Check for system state changes or policy triggers
    cmp [system_state], 0
    je .monitor_loop

    ; Log event and continue
    mov rdi, ALERT_LOG
    call log_event
    jmp .monitor_loop

    ; Cleanup and exit
.cleanup:
    mov rax, 60       ; sys_exit
    xor rdi, rdi      ; status 0
    syscall

    ; Fallback to ensure infinite monitoring if sys_exit is blocked
    jmp .monitor_loop
