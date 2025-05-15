.model small
.stack 100h
.data
    parlist1 label byte
        maxlen1 db 100
        actlen1 db ?
        str1 db 100 dup(' ')
    prompt1 db 0Dh, 0Ah, "Enter your full name (FN, M.I, LN): $"
    pr_name db 0Dh, 0Ah, "Given Name: $"
    pr_email db 0Dh, 0Ah, "Email Address: $"
    emailEx db "@gmail.com$"
    email db ?

.code
start:
    mov ax, @data
    mov ds, ax
innit:
    lea dx,prompt1
    call read

    mov ah, 0Ah
    lea dx, parlist1
    int 21h

   cld
   lea si, str1
   lea di, email

   lodsb
   call capital
   stosb

find_space:


capital:
    cmp al,'a'
    jb cap_done
    cmp al,'z'
    ja cap_done
    sub al,20h

cap_done:
    ret


read:
    mov ah,9
    int 21h

end start