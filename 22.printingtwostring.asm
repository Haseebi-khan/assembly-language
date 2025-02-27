.model small
.stack 100h

.data
    
    str1 db "Haseeb$" 
    str2 db "Khan$" 



.code

    main proc
        mov ax, @data
        mov ds,ax

        
        lea dx, str1
        mov ah, 09h
        int 21h

        mov dx, 10
        mov ah,2
        int 21h

        mov dx, 13
        mov ah,2
        int 21h

        lea dx, str2
        mov ah, 09h
        int 21h

        mov ah,04ch
        int 21h

    main endp
end main







.model small
.stack 100h

.data
    msg1 db "Enter the String: $"
    msg2 db 13,10, "Reverse string is: $"
    msg3 db 13,10,"Length of string is: $"
    string db 100 dup('$')
    length dw 0

.code
    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg1
        mov ah, 09h
        int 21h

        lea si, string
        mov cx, 100

    readinput:
        mov ah, 01h
        int 21h
        cmp al, 13         ; Check if Enter key is pressed
        je terminate_input
        
        mov [si], al
        inc si
        inc length
        
        loop readinput

    terminate_input:
        mov byte ptr [si], '$'  ; Null-terminate the string
        
        lea dx, msg2
        mov ah, 09h
        int 21h

        lea si, string
        mov cx, length

    push_loop:
        dec si
        mov al, [si]
        push ax           ; Push each character onto the stack

        loop push_loop

    pop_loop:
        pop ax            ; Pop each character from the stack
        mov dl, al
        mov ah, 02h
        int 21h

        loop pop_loop

        lea dx, msg3
        mov ah, 09h
        int 21h

        mov ax, length    ; Move length into AX for output
        add ax, 30h       ; Convert to ASCII
        mov dl, al
        mov ah, 02h
        int 21h

        mov ah, 4Ch
        int 21h
    main endp
end main




.model small
.stack 100h

.data
     msg1 db "Enter the String: $"   
     msg2 db 13,10, "Reverse stringis is: ",10,13,'$'    
     msg3 db 13,10,"Length of sting is: $"
     string db 9 dup('$') 
     length db 0
     
          

.code
    main proc 
        
    mov ax, @data
    mov ds,ax

    lea dx, msg1 
    mov ah, 09h
    int 21h
    
    lea si,string
    mov cx,10
    
    readinput:
        mov ah, 01h
        int 21h
        
        mov [di],al 
        push ax
        cmp al, 13
        
        
        inc length
        
        je jumpreversestring
        
        inc si
        inc di
        
     loop readinput         
                      
    
     jumpreversestring: 
 
 
    lea dx, msg2 
    mov ah, 09h
    int 21h
          
                    
        xor si,si
            
        lea si, string
        mov cx, 10

        loop2:


            pop bx
            mov dx,bx
            mov ah,02h
            int 21h 

        loop loop2 
        
        
    lea dx, msg3 
    mov ah, 09h
    int 21h        
    
     mov bl, length      
    ; add bl,48
     
     mov dl,bl
     mov ah,02
     int 21h

    mov ah, 04ch
    int 21h
    main endp
end main