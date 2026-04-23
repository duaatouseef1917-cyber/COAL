.model small
.stack 100h

.data
arr db 5 dup(?)

msg1 db 0Dh,0Ah,"Even numbers are: $"
msg2 db 0Dh,0Ah,"Total even count: $"

.code
main proc
    mov ax,@data
    mov ds,ax

    ; -------- INPUT --------
    mov cx,5
    mov si,offset arr

input:
    mov ah,1
    int 21h
    mov [si],al
    inc si
    loop input

    ; -------- PRINT EVEN NUMBERS --------
    mov ah,09h
    lea dx,msg1
    int 21h

    mov cx,5
    mov si,offset arr
    mov bl,0          ; even counter

check:
    mov al,[si]
    sub al,30h

    test al,1
    jnz skip

    ; print even number
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h

    mov dl,' '
    mov ah,02h
    int 21h

    inc bl

skip:
    inc si
    loop check

    ; -------- PRINT COUNT --------
    mov ah,09h
    lea dx,msg2
    int 21h

    add bl,30h
    mov dl,bl
    mov ah,02h
    int 21h

    ; EXIT
    mov ah,4ch
    int 21h

main endp
end main