section .data
    palabra db 'hola',10
    longitud equ $ - palabra

section .text
    global _start

_start:
    mov ecx, longitud
    mov esi, palabra

convierte:
    mov al, [esi]
    cmp al, 'a'
    jl no_cambiar
    cmp al, 'z'
    jg no_cambiar
    sub al, 32
    mov [esi], al

no_cambiar:
    inc esi
    loop convierte

    mov eax, 4
    mov ebx, 1
    mov ecx, palabra
    mov edx, longitud
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80