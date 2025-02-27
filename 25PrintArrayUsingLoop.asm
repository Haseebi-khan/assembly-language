.model small
.stack 100h

.data
    str1 db 'Haseeb Khan'
    


.code

    main proc
        mov ax, @data
        mov ds,ax

        lea si, str1
        
        mov cx, 12

        loopprintname:
            mov dl, [si]
            mov ah,02h
            int 21h

            inc si


        loop loopprintname

        mov ah, 04ch
        int 21h
    main endp
end main