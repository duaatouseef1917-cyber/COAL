.model small
.stack 100h

.data
str db 'MADAM$'
pal db 'Palindrome$'
notpal db 'Not Palindrome$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset str

;Push all characters
push_all:
    mov al, [si]
    cmp al, '$'
    je check_pal
    mov ah, 0
    push ax
    inc si
    jmp push_all

;Reset pointer
check_pal:
    mov si, offset str

compare_loop:
    mov al, [si]
    cmp al, '$'
    je is_palindrome

    pop bx
    cmp al, bl
    jne not_palindrome

    inc si
    jmp compare_loop

is_palindrome:
    mov ah, 9
    lea dx, pal
    int 21h
    jmp exit

not_palindrome:
    mov ah, 9
    lea dx, notpal
    int 21h

exit:
    mov ah, 4ch
    int 21h

main endp
end main