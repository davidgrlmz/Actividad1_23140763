section .data
    numeros db '1', 10, '2', 10, '3', 10, '4', 10, '5', 10
    longitud equ $ - numeros

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, numeros
    mov edx, longitud
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80