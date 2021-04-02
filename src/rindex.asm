BITS 64
global rindex
section .text
    _rindex:
        cmp rdi, BYTE 0
        je return_NULL
        xor rdx, rdx
        mov r9b, sil
    strlen_loop:
        inc rdx
        cmp [rdi + rdx], BYTE 0
        jnz strlen_loop
    rindex_loop:
        mov r8b, BYTE [rdi + rdx]
        cmp r8b, r9b
        je return
        cmp rdx, 0
        je return_NULL
        dec rdx
        jmp rindex_loop
    return:
        add rdi, rdx
        mov rax, rdi
        ret
    return_NULL:
        mov rax, 0
        ret