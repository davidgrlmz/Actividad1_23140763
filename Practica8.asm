section .data
    numero dd 12
    msgPar db "Es par", 10
    lenPar equ $ - msgPar
    msgImpar db "Es impar", 10
    lenImpar equ $ - msgImpar

section .text
    global _start

_start:
    mov eax, [numero]
    and eax, 1
    jz es_par
    jmp es_impar

es_par:
    mov eax, 4
    mov ebx, 1
    mov ecx, msgPar
    mov edx, lenPar
    int 0x80
    jmp salir

es_impar:
    mov eax, 4
    mov ebx, 1
    mov ecx, msgImpar
    mov edx, lenImpar
    int 0x80

salir:
    mov eax, 1
    xor ebx, ebx
    int 0x80