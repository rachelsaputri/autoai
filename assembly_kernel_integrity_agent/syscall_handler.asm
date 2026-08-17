section .data
    ; Syscall validation tables
    restricted_calls db 59, 15, 16, 21, 254 ; Example restricted syscalls (open, exit, etc.)
    restricted_count equ 5

section .text
    global syscall_hook
    extern log_event

syscall_hook:
    ; RAX contains syscall number
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11

    mov r12, rax          ; Save syscall number
    mov r13, rdi          ; Save first argument
    mov r14, rsi          ; Save second argument
    mov r15, rdx          ; Save third argument

    ; Check against restricted calls
    lea r10, [restricted_calls]
    mov rcx, restricted_count
.restricted_loop:
    cmp byte [r10], r12
    je .policy_violation
    inc r10
    loop .restricted_loop

    ; If not restricted, allow normal flow (simulated)
    jmp .allow_syscall

.policy_violation:
    ; Log violation and enforce policy
    mov rdi, 'V'
    call log_event
    mov rax, -1           ; Return error
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

.allow_syscall:
    ; Restore registers and return
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ; Return original syscall result simulation
    xor rax, rax
    ret
