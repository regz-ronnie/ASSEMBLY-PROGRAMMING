section .data
    msg db "Hello, World!", 0xA  ; Initialized data
    msg_len equ $ - msg          ; Length of the message

section .bss
    buffer resb 64   ; Reserve 64 bytes in uninitialized data segment

section .text
    global _start

_start:
    ; Writing message using sys_write
    mov eax, 4      ; syscall number for sys_write
    mov ebx, 1      ; file descriptor 1 (stdout)
    mov ecx, msg    ; pointer to message in .data
    mov edx, msg_len ; message length
    int 0x80        ; call kernel

    ; Exiting the program
    mov eax, 1      ; syscall number for sys_exit
    xor ebx, ebx    ; exit code 0
    int 0x80        ; call kernel
