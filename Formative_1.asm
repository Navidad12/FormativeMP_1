.model small
.stack 100h
.data
    newline db 13, 10, '$'
    prompt1 db "Enter a character: $"
    prompt2 db "Character entered: $"
    prompt_special db "You entered a special character. $"
    prompt_upper db "You entered an uppercase letter. $"
    prompt_lower db "You entered a lowercase letter. $"
    prompt_digit db "You entered a numerical character. $"
    prompt_continue db "Press y to continue, any key to stop: $"

.code
start:
    mov ax, @data
    mov ds, ax

innit:
    lea dx, newline
    call read

    lea dx, prompt1
    call read

    mov ah, 01h
    int 21h
    mov bl, al

    lea dx, newline
    call read

    cmp bl, 'a'
    JL c_uppercase
    cmp bl, 'z'
    JG c_uppercase

    lea dx, prompt_lower
    call read
    jmp done_check

read:
    mov ah, 9
    int 21h
    ret

c_uppercase:
    cmp bl, 'A'
    JL c_digit
    cmp bl, 'Z'
    jg c_digit
    lea dx, prompt_upper
    call read
    jmp done_check


c_digit:
    cmp bl, '0'
    JL c_special
    cmp bl, '9'
    JG c_special
    lea dx, prompt_digit
    call read
    jmp done_check

c_special:
    lea dx, prompt_special
    call read
    jmp done_check


done_check:
    lea dx, newline
    call read
    lea dx, prompt_continue
    call read
    mov ah, 01h
    int 21h
    cmp al, 'y'
    je innit

    mov ah, 4Ch
    int 21h
end start