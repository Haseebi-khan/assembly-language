.model small
.stack 100h

.data


.code

    main proc

        mov bl,3
        mov cl,1
        sub bl,cl

        add bl, 48

        mov dl, bl
        mov ah, 02h
        int 21h

        mov ah,04ch
        int 21h

    main endp
end main