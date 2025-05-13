section .data
    l1 db 'Arriba el Monterrey!', 0xA
    l2 db 'Arriba el Monterrey!', 0xA
    l3 db 'Arriba el Monterrey!', 0xA
    len1 equ $ - l1
    len2 equ $ - l2
    len3 equ $ - l3

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1

    mov ecx, l1
    mov edx, len1
    int 0x80

    mov ecx, l2
    mov edx, len2
    int 0x80

    mov ecx, l3
    mov edx, len3
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80