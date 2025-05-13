section .data
    msg db "Resultado: ", 0
    salto db 10, 0

section .bss
    buffer resb 3

section .text
    global _start

_start:
    mov eax, 100
    mov ebx, 4
    xor edx, edx
    div ebx

    mov ecx, 10
    xor edx, edx
    div ecx

    add eax, '0'
    mov [buffer], al
    add edx, '0'
    mov [buffer+1], dl
    mov byte [buffer+2], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 10
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