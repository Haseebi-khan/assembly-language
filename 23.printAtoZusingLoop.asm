.model small
.stack 100h

.data


.code

    main proc
        mov ax, @data
        mov ds,ax

        mov cx,26  
        mov bl,65
        
        loopAtoZ:

            mov dl, bl
            mov ah, 02h
            int 21h   
            add bl,1 
            

        loop loopAtoZ

        
        mov ah,04ch
        int 21h

    main endp
end main