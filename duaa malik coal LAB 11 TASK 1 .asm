.model small
.stack 100h

.data
string db 'HELLO$'

.code
main proc

mov ax, @data
mov ds, ax

mov si, offset string
mov cx, 0

; push characters into stack
push_loop:
    mov al, [si]
    cmp al, '$'
    je done_push

    mov ah, 0
    push ax
    inc cx
    inc si
    jmp push_loop

done_push:

; display count
add cl, '0'
mov dl, cl
mov ah, 2
int 21h

mov ah, 4ch
int 21h

main endp
end main




