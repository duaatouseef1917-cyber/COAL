.model small
.stack 100h
.data
msg db 'Enter a number (use - for negative): $'
positiveMsg db 0dh,0ah,'Positive$'
negativeMsg db 0dh,0ah,'Negative$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 01h
    int 21h       
    
    cmp al, '-'
    je negative

positive:
    mov ah, 09h
    lea dx, positiveMsg
    int 21h
    jmp end_prog

negative:
    mov ah, 09h
    lea dx, negativeMsg
    int 21h

end_prog:
    mov ah, 4ch
    int 21h
end main


