BITS 64
global memset
section .text
    memset:
        cmp rdi, BYTE 0
        je return_NULL
        cmp rdx, 0
        jl return_NULL
        xor rcx, rcx
        jmp my_memset_loop
    my_memset_loop:
        cmp rcx, rdx
        je return
        mov BYTE [rdi + rcx], sil
        inc rcx
        jmp my_memset_loop
    return:
        mov rax, rdi
        ret
    return_NULL:
        mov rax, 0
        ret