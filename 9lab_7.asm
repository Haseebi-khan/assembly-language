.model small 
.stack 100h

.data
 msg db "Enter a Character: $"
 newline db 10,13,'$'

.code

main proc

mov ax, @data
mov ds, ax


lea dx, msg
mov ah,09h
int 21h

mov ah, 01h
int 21h
mov bl,al

mov ah, 02h  ; set curser position
mov bh,00h  ; page number
mov dh,12 ; row number
mov dl,39 ;  coloum number
int 10h    ;interrupt 10th


;counter register
mov cx, 10
show_loop:
	mov  bh, dl
    inc bh 
;display character
mov ah,02h
mov dl,bl
int 21h
;increment for next character
inc bl
;mov curser to the next  postion.
mov dl,bh 
              ;mov  to the next column
mov ah, 02h
int 10h      

      loop show_loop

mov ah, 04ch
int 21h


main endp
end main