.model small
.stack 100h

.data
    msg2 db 13,10,"Even Number$"
    msg3 db 13,10,"Odd Number$"
    msg1 db "Enter the number: $",13,10


.code

    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg1
        mov ah,09h
        int 21h

        mov ah, 01h
        int 21h

        mov bl,2

        div bl

        cmp ah, 0 
        je even
        
            lea dx,msg3
            mov ah, 09h
            int 21h

            jmp Exit


        even:
            lea dx,msg2
            mov ah, 09h
            int 21h


    Exit:

        mov ah, 04ch
        int 21h
    main endp
end main