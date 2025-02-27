.model 
.stack 100h

.data

    arr db 4,3,5,2,7   
    msg1 db "Smallest value is: $"

.code
    main proc
    mov ax,@data
    mov ds, ax

    lea si,arr
    mov cx,5
    mov bl,[si]

    loop1:

        cmp [si],bl
        ;compare also with large
        jle small
        
        campare:
            inc si
        
    loop loop1    
          
        lea dx,msg1
        mov ah,09h
        int 21h
         
        add bl, 48
        mov dl,bl
        mov ah, 02h
        int 21h
        jmp exit
    
    ;compare also with large      
    small: 
        mov bl,[si]
        jmp campare

        exit:
        

        mov ah, 04ch
        int 21h

    main endp
end main


