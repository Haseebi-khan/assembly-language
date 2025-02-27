.model small
.stack 100h

.data
    msg1 db "Enter number which table you want to print: $"
    msg2 db 10,13, "Table: $"
    msg3 db " X $"
    msg4 db " = $"
    counter db 49
    t_number db ?
    value db 0d

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1   ; Enter number which table you want to print:
    mov ah, 09h
    int 21h
                     
    mov ah, 01h      ; user input
    int 21h                   ;suppose
    
    mov t_number, al      ;3
    mov value, al         ;3
    
    lea dx, msg2          ;Table: $
    mov ah, 09h
    int 21h
    
    mov dl,t_number   ;Table: 3  
    mov ah, 02h
    int 21h
    
    ;setting postion of the table
    mov ah, 02h   ;curser position
    mov bh, 00    ;page num
    mov dh,03     ;row
    mov dl,00     ;colon
    int 10h
    
    mov cx, 10 
    table:
    
         mov dl,t_number
         mov ah,02h
         int 21h
            
         lea dx, msg3   ;"X $"
         mov ah, 09h
         int 21h

         mov dl, counter
         mov ah,02h
         int 21h    
           
         add counter,1

         lea dx, msg4    ;" = $"
         mov ah, 09h
         int 21h    

         mov dl, value
         mov ah,02h
         int 21h  
         add value, 3
         
         
         
         mov ah, 02h   ;curser position
         mov bh, 00    ;page num
         add dh, counter
         mov dl,00   
         int 10h
    
    loop table
    
    
    mov ah, 4Ch
    int 21h

main endp
end main