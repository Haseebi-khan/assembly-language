.model small 
.stack 10h
.data
.code
mian proc

mov ah,1
int 21h


mov dl,al
mov ah, 2
int 21h

mov ah,04ch
int 21h

main endp
end main

