BITS 64
global strpbrk
section .text
    strpbrk:
        cmp rdi, BYTE 0
        je return_NULL
        cmp rsi, BYTE 0
        je return_NULL
        xor rdx, rdx
        xor r15, r15
        jmp strpbrk_loop
    strpbrk_loop:
        xor rcx, rcx
        mov r8b, BYTE [rdi + rdx]
        inc rdx
        cmp r8b, BYTE 0
        je return_NULL
        jmp cmp_loop
    cmp_loop:
        mov r9b, BYTE [rsi + rcx]
        cmp r9b, BYTE 0
        je strpbrk_loop
        cmp r8b, r9b
        je return
        inc rcx
        jmp cmp_loop
    return_NULL:
        mov rax, 0
        ret
    return:
        dec rdx
        add rdi, rdx
        mov rax, rdi
        ret