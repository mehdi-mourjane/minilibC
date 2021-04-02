BITS 64
global strcspn
section .text
    strcspn:
        xor rdx, rdx
        cmp rdi, BYTE 0
        je return
        cmp rsi, BYTE 0
        je return
        mov rdx, -1
        jmp strcspn_loop
    strcspn_loop:
        inc rdx
        mov rcx, -1
        mov r8b, BYTE [rdi + rdx]
        cmp r8b, BYTE 0
        je return
        jmp char_cmp
    char_cmp:
        inc rcx
        mov r9b, BYTE [rsi + rcx]
        cmp r9b, BYTE 0
        je strcspn_loop
        cmp r8b, r9b
        je return
        jmp char_cmp
    return:
        mov rax, rdx
        ret