.model small
.stack 100h
    
.data
    msg db "Enter the String: $",13,10  
    msg2 db "THE String is: $"
    
    string db 20 dup("$")   
    
.code
    main proc
        
    mov ax,@data
    mov dx, ax
    
    
    lea dx, msg       
    mov ah, 09h
    int 21h
    
    lea dx, string+2       
    mov ah, 0Ah
    int 21h
    
    lea dx,msg2
    mov ah,09h
    int 21h  
    
    
    lea dx,string
    mov ah,09h
    int 21h
          

        
    main endp
end main