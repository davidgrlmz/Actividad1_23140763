
section .data
    numeros db '5',10,'4',10,'3',10,'2',10,'1',10
    longitud equ $ - numeros

section .text
    global _start

_start:
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; STDOUT
    mov ecx, numeros    ; dirección del mensaje
    mov edx, longitud   ; longitud total
    int 0x80            ; llamar al sistema

    ; salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80