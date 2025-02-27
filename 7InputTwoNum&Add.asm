.model small
.stack 100h

.data


.code

    main proc

        mov bl, 'A'
        add bl, 20

        mov dl,bl
        mov ah, 02h
        int 21h


        mov ah,04ch
        int 21h
                             
    main endp
end main