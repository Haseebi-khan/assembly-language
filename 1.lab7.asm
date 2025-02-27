.model small  
 .stack 100h

.data 
    st1 db "Enter character: $", 13,10 
    st2 db 13,10,"you have entered chacter: ",24h 
    result db ?

    
 
 
 .code
 start:  
    
    mov ax, @data
    mov ds, ax
        
    
    lea dx, st1
    mov ah, 09h
    int 21h
    
    
    mov ah, 01h 
    int 21h   
    mov bl, al
    
    sub bl, 20h 

    mov result, bl 
    
    lea dx, st2
    mov ah,09h
    int 21h
    
    mov dl,result
    mov ah, 02
    int 21h
    
    mov ah, 4Ch
    int 21h
end start 