.model small
.stack 100h

.data
arr db 5 dup(?)
msg1 db "Enter 5 digits: $"
msg2 db 0Dh,0Ah,"Largest number is: $"

.code
main proc
    mov ax,@data
    mov ds,ax

    ; -------- PRINT INPUT MESSAGE --------
    mov ah,09h
    lea dx,msg1
    int 21h

    ; -------- INPUT --------
    mov cx,5
    mov si,offset arr

input:
    mov ah,1
    int 21h
    sub al,30h
    mov [si],al
    inc si
    loop input

    ; -------- FIND MAX --------
    mov si,offset arr
    mov al,[si]
    mov bl,al

    inc si
    mov cx,4

find:
    mov al,[si]
    cmp al,bl
    jbe skip
    mov bl,al

skip:
    inc si
    loop find

    ; -------- NEW LINE + MESSAGE --------
    mov ah,09h
    lea dx,msg2
    int 21h

    ; -------- PRINT RESULT --------
    add bl,30h
    mov dl,bl
    mov ah,02h
    int 21h

    ; exit
    mov ah,4ch
    int 21h

main endp
end main