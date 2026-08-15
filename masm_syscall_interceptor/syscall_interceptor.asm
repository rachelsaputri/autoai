;
; MASM System Call Interceptor
; x86 Assembly - Microsoft Assembly
;
;
; This module implements a low-level system call interceptor and auditor.
; It hooks critical system calls, logs execution contexts, detects privilege escalation attempts,
; and generates low-latency alert triggers for the broader security compliance ecosystem.
;

.586
.model flat, stdcall
option casemap:none

include macros.inc
include windows.inc
include kernel32.inc
include ntoskrnl.inc
includelib kernel32.lib
includelib ntoskrnl.lib

; Constants
MAX_LOG_BUFFER_SIZE EQU 1024
SYS_CALL_TABLE_SIZE EQU 300
PRIVILEGE_ESCALATION_THRESHOLD EQU 3

; Data Section
.data
    szAppName db "MASM Syscall Interceptor", 0
    szLogHeader db "Time|ProcessID|ThreadID|SysCallID|Args|Return|Status|Alert", 0
    szAlertPrefix db "[ALERT] Privilege Escalation Attempt Detected: ", 0
    szLogFile db "syscall_audit.log", 0
    hLogFile HANDLE ?
    szBuffer MAX_LOG_BUFFER_SIZE DUP(?)
    szAlertBuffer MAX_LOG_BUFFER_SIZE DUP(?)
    lpOriginalSyscallHandlers SYS_CALL_HANDLER_TYPE SYS_CALL_TABLE_SIZE DUP(?)
    g_IsMonitoring BOOL FALSE

; Code Section
.code

;
; Helper: Format a string into a buffer
; Parameters:
;   pBuffer - pointer to output buffer
;   pFormat - pointer to format string
;   ...     - arguments for format string
;
FormatString PROTO :DWORD, :DWORD

;
; Helper: Write log entry to file
; Parameters:
;   pLogEntry - pointer to log entry string
;
WriteLogEntry PROTO :DWORD

;
; Helper: Log a system call event
; Parameters:
;   pContext - pointer to system call context structure
;
LogSystemCall PROTO :DWORD

;
; Helper: Detect privilege escalation
; Parameters:
;   pContext - pointer to system call context structure
;
DetectPrivilegeEscalation PROTO :DWORD

;
; System Call Hook Function
; This function replaces the original system call handler.
;
SyscallHook PROC
    push ebp
    mov ebp, esp
    
    ; Save registers
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    push esp
    
    ; Extract system call ID from EAX
    mov eax, [ebp + 0x1C] ; System call ID
    mov ecx, eax
    
    ; Get current process ID
    call GetCurrentProcessId
    mov esi, eax ; Process ID
    
    ; Get current thread ID
    call GetCurrentThreadId
    mov edi, eax ; Thread ID
    
    ; Prepare context structure for logging
    lea eax, [ebp - 32]
    mov [eax], ecx ; SysCallID
    mov [eax + 4], esi ; ProcessID
    mov [eax + 8], edi ; ThreadID
    mov [eax + 12], [ebp + 0x1C] ; Args
    mov [eax + 16], [ebp + 0x20] ; Return (placeholder)
    mov [eax + 20], 0 ; Status (placeholder)
    mov [eax + 24], 0 ; Alert (placeholder)
    
    ; Log the system call
    push eax
    call LogSystemCall
    add esp, 4
    
    ; Check for privilege escalation
    push eax
    call DetectPrivilegeEscalation
    add esp, 4
    
    ; Restore registers
    pop esp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    
    ; Call original system call handler
    ; Note: In a real implementation, this would jump to the original handler
    ; For demonstration, we return with a success status
    xor eax, eax
    ret
SyscallHook ENDP

;
; Main Entry Point
;
Start PROC
    ; Initialize log file
    invoke CreateFile, ADDR szLogFile, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
    mov hLogFile, eax
    
    .if eax == INVALID_HANDLE_VALUE
        jmp ExitProgram
    .endif
    
    ; Write log header
    invoke lstrcpy, ADDR szBuffer, ADDR szLogHeader
    push ADDR szBuffer
    call WriteLogEntry
    add esp, 4
    
    ; Start monitoring
    mov g_IsMonitoring, TRUE
    
    ; Install hooks
    ; Note: In a real implementation, this would involve modifying the IDT or SSDT
    ; For demonstration, we simulate hook installation
    mov ecx, SYS_CALL_TABLE_SIZE
    xor ebx, ebx
InstallLoop:
    mov [lpOriginalSyscallHandlers + ebx * 4], OFFSET SyscallHook
    add ebx, 1
    loop InstallLoop
    
    ; Main monitoring loop
MonitoringLoop:
    .if g_IsMonitoring
        ; Wait for next system call event
        invoke Sleep, 1000
        jmp MonitoringLoop
    .endif
    
ExitProgram:
    ; Close log file
    .if hLogFile != 0
        invoke CloseHandle, hLogFile
    .endif
    
    ; Exit process
    invoke ExitProcess, 0
Start ENDP

;
; Helper Functions
;
FormatString PROC pBuffer:DWORD, pFormat:DWORD
    invoke wsprintf, pBuffer, pFormat
    ret
FormatString ENDP

WriteLogEntry PROC pLogEntry:DWORD
    LOCAL dwBytesWritten:DWORD
    
    invoke WriteFile, hLogFile, pLogEntry, MAX_LOG_BUFFER_SIZE, ADDR dwBytesWritten, NULL
    
    ; Append newline
    invoke lstrcpy, ADDR szBuffer, ADDR szLogHeader
    invoke lstrlen, ADDR szBuffer
    mov ecx, eax
    add ecx, 1
    mov [pBuffer + ecx], 0Ah ; Newline
    
    ret
WriteLogEntry ENDP

LogSystemCall PROC pContext:DWORD
    LOCAL dwBytesWritten:DWORD
    
    ; Format log entry
    invoke FormatString, ADDR szBuffer, ADDR szLogHeader
    
    ; Write log entry
    push ADDR szBuffer
    call WriteLogEntry
    add esp, 4
    
    ret
LogSystemCall ENDP

DetectPrivilegeEscalation PROC pContext:DWORD
    
    ; Check for privilege escalation attempts
    ; In a real implementation, this would analyze the system call ID and arguments
    ; For demonstration, we simulate detection
    mov eax, [pContext + 12] ; Args
    .if eax > PRIVILEGE_ESCALATION_THRESHOLD
        ; Generate alert
        invoke FormatString, ADDR szAlertBuffer, ADDR szAlertPrefix
        
        ; Write alert to log file
        push ADDR szAlertBuffer
        call WriteLogEntry
        add esp, 4
    .endif
    
    ret
DetectPrivilegeEscalation ENDP

END Start
