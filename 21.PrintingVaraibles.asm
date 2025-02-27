.model small
.stack 100h

.data
var1 db 55
var2 db '2'
var3 db 13,10,'234$$'


.code

    main proc
        mov ax, @data
        mov ds,ax

        
        mov dl, var1
        mov ah, 02h
        int 21h


        mov dl, var2
        mov ah, 02h
        int 21h

        lea dx, var3
        mov ah, 09h
        int 21h

        mov ah,04ch
        int 21h

    main endp
end main