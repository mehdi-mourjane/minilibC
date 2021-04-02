BITS 64
global memcpy
section .text
    memcpy:
        cmp rdi, BYTE 0
        je return_NULL
        cmp rsi, BYTE 0
        je return_NULL
        cmp rdx, 0
        jl return_NULL
        xor rcx, rcx
        jmp my_memcpy_loop
    my_memcpy_loop:
        cmp rcx, rdx
        je return
        mov r8b, BYTE [rsi + rcx]
        mov BYTE [rdi + rcx], r8b
        inc rcx
        jmp my_memcpy_loop
    return:
        mov rax, rdi
        ret
    return_NULL:
        mov rax, 0
        ret