.model small
.stack 100h

.data
    msg db "Enter first number: $"
    msg2 db 10,13, "Enter Second number: $"
    ans  db 10,13, "Ans: $"
    
.code
    main proc
    mov ax,@data
    mov ds,ax
    
    lea dx, msg
    mov ah,09
    int 21h
    
    mov ah,1h
    int 21h
    
    mov cl, al
           
    lea dx, msg2
    mov ah,09
    int 21h       
           
           
    mov ah, 1h
    int 21h
    
    mov bl,al
    
    
    add cl,bl
    sub cl,48 
              
              
    lea dx, ans
    mov ah,09
    int 21h   
    
    mov dl, cl
    mov ah,2h
    int 21h   
    
    
    mov ah,04ch
    int 21

    main endp
end main