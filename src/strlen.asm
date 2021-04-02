BITS 64
global strlen
section .text
    strlen:
        xor rcx, rcx
        cmp rdi, BYTE 0
        je return
        jmp strlen_loop
    strlen_loop:
        cmp [rdi], BYTE 0
        jz return
        inc rcx
        inc rdi
        jmp strlen_loop
    return:
        mov rax, rcx
        ret