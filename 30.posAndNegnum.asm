.model 
.stack 100h

.data
    msg1 db "Enter the numbers: $",13,10
    msg2 db 13,10, "Numbers is zero.$"
    msg3 db 13,10, "Numbers  is positive.$"
    msg4 db 13,10, "Numbers is negitive.$"
.code
    main proc
    mov ax,@data
    mov ds, ax

    lea dx, msg1
    mov ah,09h
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al

    cmp bl, 48 

    je zero
    jg positive
    jl negitive
    
    zero:
        lea dx,msg2
        mov ah,09h
        int 21h
        jmp Exit
    positive:
        lea dx,msg3
        mov ah,09h
        int 21h
        jmp Exit

    negitive:
        lea dx,msg4
        mov ah,09h
        int 21h
        jmp Exit

    Exit:
        mov ah, 04ch
        int 21h

    main endp
end main


