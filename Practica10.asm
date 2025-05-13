section .data
    texto db 'Hola Mundo', 0
    vocales db 'aeiouAEIOU'
    mensaje db 'Hay X vocales',10

section .bss
    contador resb 1

section .text
    global _start

_start:
    xor ecx, ecx
    xor bl, bl

siguiente_letra:
    mov al, [texto + ecx]
    cmp al, 0
    je mostrar_resultado

    mov edi, 0
compara_vocal:
    cmp al, [vocales + edi]
    je es_vocal
    inc edi
    cmp edi, 10
    jl compara_vocal
    jmp no_vocal

es_vocal:
    inc bl

no_vocal:
    inc ecx
    jmp siguiente_letra

mostrar_resultado:
    add bl, '0'
    mov [mensaje + 4], bl

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, 15
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80