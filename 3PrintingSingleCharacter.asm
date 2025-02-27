.model small
.stack 100h

.data


.code

    main proc

        mov dl, 'A'
        mov ah, 02h
        int 21h

        mov dl, 'L'
        mov ah, 02h
        int 21h

        mov dl, 'I'
        mov ah, 02h
        int 21h






        mov ah,04ch
        int 21h

    main endp
end main