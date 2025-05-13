section .data
    msg db "Suma: ", 0
    salto db 10, 0

section .bss
    buffer resb 5

section .text
    global _start

_start:
    mov eax, 0
    mov ecx, 1

sumar:
    add eax, ecx
    inc ecx
    cmp ecx, 11
    jl sumar

    mov ebx, 10
    xor edx, edx
    div ebx

    add eax, '0'
    mov [buffer], al
    add edx, '0'
    mov [buffer+1], dl
    mov byte [buffer+2], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 6
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80