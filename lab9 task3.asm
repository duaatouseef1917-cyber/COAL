.model small
.stack 100h
.data
msg1 db 'Enter first number: $'
msg2 db 0dh,0ah,'Enter second number: $'

greater db 0dh,0ah,'Greater$'
smaller db 0dh,0ah,'Smaller$'
equal   db 0dh,0ah,'Equal$'

.code
main:
    mov ax, @data
    mov ds, ax

    ; ask first number
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al

    ; ask second number
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    mov bh, al

    ; compare
    cmp bl, bh
    je equal_case
    ja greater_case
    jb smaller_case

greater_case:
    mov ah, 09h
    lea dx, greater
    int 21h
    jmp end_prog

smaller_case:
    mov ah, 09h
    lea dx, smaller
    int 21h
    jmp end_prog

equal_case:
    mov ah, 09h
    lea dx, equal
    int 21h

end_prog:
    mov ah, 4ch
    int 21h
end main