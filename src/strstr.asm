BITS 64
global strstr
section .text
    strstr:
        cmp rdi, BYTE 0
        je return_NULL
        cmp rsi, BYTE 0
        je return_NULL
        cmp BYTE [rsi], 0
        je return
        mov r10b, BYTE [rsi]
        xor rdx, rdx
    strlen_loop:
        inc rdx
        cmp [rsi + rdx], BYTE 0
        jnz strlen_loop
    strstr_loop:
        xor rcx, rcx
        cmp BYTE [rdi], BYTE 0
        je return_NULL
        cmp BYTE [rdi], r10b
        je strncmp
        inc rdi
        jmp strstr_loop

    strncmp:
        mov r8b, BYTE [rdi + rcx]
        mov r9b, BYTE [rsi + rcx]
        inc rdi
        cmp r8b, r9b
        jne strstr_loop
        dec rdi
        cmp r8b, BYTE 0
        je return
        inc rcx
        cmp rcx, rdx
        je return
        jmp strncmp
    return:
        mov rax, rdi
        ret
    return_NULL:
        mov rax, 0
        ret
    
