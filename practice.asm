.model small
.stack 100h

.data
    msg1 db "Enter the string: $"
    str1 db 13,10, 20 dup('$'),
    


.code

    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg1
        mov ah, 09h
        int 21h


        lea si, str1
        again:
            mov ah, 01h
            int 21h
            cmp al, 13
            je done
        
            mov [si],al
            inc si
        jmp again

        done:         
        
            mov dx,13
            mov ah,02h
            int 21h
            
            mov dx,10
            mov ah,02h
            int 21h
            
            lea dx, str1
            mov ah,09h
            int 21h
                      
                      

        mov ah, 04ch
        int 21h
    main endp
end main