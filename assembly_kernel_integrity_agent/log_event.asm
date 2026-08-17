section .data
    log_buffer resb 1024

section .text
    global log_event
    extern _syscall_write

log_event:
    ; RDI contains log type character
    push rdi
    mov rax, 1           ; sys_write
    mov rdi, 2           ; stdout (or a specific log fd)
    lea rsi, [log_buffer]
    mov rdx, 1           ; length
    syscall
    pop rdi
    ret
