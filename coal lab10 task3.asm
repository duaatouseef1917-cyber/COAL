.model small
.stack 100h

.data
msg1 db "Enter number: $"
msg2 db 0Dh,0Ah,"Reverse is: $"
arr db 20 dup(?)

.code
main proc
    mov ax,@data
    mov ds,ax

    ; -------- MESSAGE --------
    mov ah,09h
    lea dx,msg1
    int 21h

    ; -------- INPUT UNTIL ENTER --------
    mov si,offset arr

input:
    mov ah,1
    int 21h

    cmp al,0Dh
    je done_input

    mov [si],al
    inc si
    jmp input

done_input:
    ; length calculate
    mov bx,si
    sub bx,offset arr

    ; -------- MESSAGE 2 --------
    mov ah,09h
    lea dx,msg2
    int 21h

    ; -------- REVERSE PRINT --------
    dec si
    mov cx,bx

rev:
    mov dl,[si]
    mov ah,2
    int 21h
    dec si
    loop rev

    ; EXIT
    mov ah,4ch
    int 21h

main endp
end main