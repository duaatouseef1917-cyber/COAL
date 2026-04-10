.model small
.stack 100h
.data
.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5       

start:
    mov dl, 'A'
    mov ah, 02h
    int 21h

    dec cx
    cmp cx, 0
    jne start       ; using JMP 

    mov ah, 4ch
    int 21h
end main


