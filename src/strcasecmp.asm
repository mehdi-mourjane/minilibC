BITS 64
global strcasecmp
section .text
    strcasecmp:
        cmp rdi, BYTE 0
        je return_true
        cmp rsi, BYTE 0
        je return_true
        xor rcx, rcx
        jmp strcmp_loop
    strcmp_loop:
        mov r8b, BYTE [rdi + rcx]
        mov r9b, BYTE [rsi + rcx]
        inc rcx
        cmp r8b, r9b
        jg alpha
        cmp r8b, r9b
        jl beta
        cmp r8b, BYTE 0
        je return_true
        jmp strcmp_loop
    alpha:
        add r9b, BYTE 32
        cmp r8b, r9b
        jne return_false_alpha
        jmp strcmp_loop
    beta:
        sub r9b, BYTE 32
        cmp r8b, r9b
        jne return_false_beta
        jmp strcmp_loop
    return_true:
        mov rax, 0
        ret
    return_false_alpha:
        sub r9b, BYTE 32
        sub r8b, r9b
        movsx r8, r8b
        mov rax, r8
        ret
    return_false_beta:
        add r9b, BYTE 32
        sub r8b, r9b
        movsx r8, r8b
        mov rax, r8
        ret