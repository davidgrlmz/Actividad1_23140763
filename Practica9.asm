section .data
    palabra db 'HOLA',10
    longitud equ 4

section .text
    global _start

_start:
    mov ecx, longitud
    mov esi, palabra
    add esi, longitud - 1

imprime_inverso:
    mov al, [esi]
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    mov ecx, esi
    int 0x80
    dec esi
    loop imprime_inverso

    mov eax, 4
    mov ebx, 1
    mov ecx, palabra + longitud
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80