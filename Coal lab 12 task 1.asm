.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov bx, 1      ; numbers count
    mov cx, 4      ; rows

L1:
    push cx        ; save outer loop counter

    mov cx, bx     ; inner loop runs bx times
    mov dl, 1      ; start number from 1

L2:
    mov al, dl
    add al, 30h    ; convert to ASCII
    mov dl, al

    mov ah, 2
    int 21h        ; print number

    inc dl         ; next number
    sub dl, 30h    ; convert back to number
    loop L2

    ; new line
    mov dl, 10
    mov ah, 2
    int 21h

    mov dl, 13
    mov ah, 2
    int 21h

    inc bx         ; increase numbers count
    pop cx         ; restore outer loop counter
    loop L1

    mov ah, 4Ch
    int 21h

main endp
end main



