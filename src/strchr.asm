BITS 64
global strchr
section .text
    strchr:
        cmp rdi, BYTE 0
        je return_NULL
        jmp strchr_loop
    strchr_loop:
        cmp [rdi], sil
        je return
        cmp [rdi], BYTE 0
        je return_NULL
        inc rdi
        jmp strchr_loop
    return:
        mov rax, rdi
        ret
    return_NULL:
        mov rax, 0
        ret