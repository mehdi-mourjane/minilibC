BITS 64
global strncmp
section .text
    strncmp:
        cmp rdi, BYTE 0
        je return_true
        cmp rsi, BYTE 0
        je return_true
        xor rcx, rcx
        jmp strcmp_loop
    strcmp_loop:
        cmp rcx, rdx
        je return_true
        mov r8b, BYTE [rdi + rcx]
        mov r9b, BYTE [rsi + rcx]
        cmp r8b, r9b
        jne return_false
        cmp r8b, BYTE 0
        je return_true
        inc rcx
        jmp strcmp_loop
    return_true:
        mov rax, 0
        ret
    return_false:
            movsx r8, r8b
            movsx r9, r9b
            sub r8, r9
            mov rax, r8
            ret