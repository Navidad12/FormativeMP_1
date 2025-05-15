.model small
.stack 100h
.data
    char_case db ?
    newline db 13, 10, '$'
    prompt1 db "Enter a character: $"

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, prompt1
    int, 21h

    mov ah, 01h
    int 21h
    mov char_case, al


uppercase:
