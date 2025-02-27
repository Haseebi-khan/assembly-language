.model small  
 .stack 100h

.data 
    st1 db "Enter name: $", 13,10 
    st2 db 20 dup('$')
 

    
 
 
 .code
 start:  
    
    mov ax, @data
    mov ds, ax
        
    
    lea dx, st1
    mov ah, 09h
    int 21h
    
    
    lea dx, st2+2 
    mov ah, 0Ah
    int 21h 
    
    mov st2,dl
    
    
    
    
    lea dx,st2
    mov ah, 09
    int 21h
    
    mov ah, 4Ch
    int 21h
end start 