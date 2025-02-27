.model small
.stack 100h

.data

    msg db "Enter a Number: ",13,10,'$'
    even_msg db "Even$"
    odd_msg db "Odd$"




    ;Reads a number from the user.
    ;Checks if the number is even or odd 
    ;using the parity flag (PF) and conditional jumps.
    ;Displays "Even" or "Odd".

.code
    main proc
    mov ax, @data
    mov ds, ax
    

    lea dx,msg
    mov ah,09h
    int 21h

    mov ah, 01h
    int 21h

    sub al, '0'

    test al, 1
    jz is_even
    jum

















    
    main endp
end main
