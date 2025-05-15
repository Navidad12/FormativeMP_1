.model small
.stack 100h
.data
    parlist1 label byte
        maxlen1 db 80
        actlen1 db ?
        str1 db 80 dup(' ')
    prompt1 db "Enter your full name: $"
    pr_name db "Given Name: $"
    pr_email db "Email Address: $"

.code
start:
    mov ax, @data
    mov ds, ax
innit:
    lea dx,prompt1
    call read


read:
    mov ah,9
    int 21h

end start