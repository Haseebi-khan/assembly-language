.model small
.stack 100h

.data
    msg1 db "Haseeb khan$"
    


.code

    main proc
        mov ax, @data
        mov ds, ax

        lea si, msg1
        mov cx, 12

        loop1:

            mov bl,[si]
            push bx
            inc si

            loop loop1

        mov cx, 12

        loop2:


            pop bx
            mov dx,bx
            mov ah,02h
            int 21h 

        loop loop2






        mov ah, 04ch
        int 21h
    main endp
end main