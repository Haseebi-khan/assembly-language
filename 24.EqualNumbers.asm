.model small
.stack 100h

.data
    EqualNum db "Numbers are Equals$",10,13
    NotEqual db "Number are Not Equal$", 10 ,13


.code

    main proc
        mov ax, @data
        mov ds,ax

        mov ah,01h
        int 21h

        mov bl, al

        mov ah,01h
        int 21h

        mov cl, al

        cmp bl,cl

        je Equalnumber

            lea dx, NotEqual
            mov ah, 09h
            int 21h

            JMP Exit


        Equalnumber:
            lea dx, EqualNum
            mov ah, 09h
            int 21h

        Exit:
            mov ah,04ch
            int 21h

    main endp
end main