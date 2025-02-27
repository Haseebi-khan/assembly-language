.model 
.stack 100h

.data
    msg1 db "Enter the numbers one by one: $",13,10
    msg2 db 13,10, "Numbers are equals.$"
    msg3 db 13,10, "Numbers first is greater.$"
    msg4 db 13,10, "Numbers second is greater.$"
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

    mov ah, 01h
    int 21h
    mov cl,al

    cmp bl, cl

    je Equal
    jg greater
    jl less
    
    Equal:
        lea dx,msg2
        mov ah,09h
        int 21h
        jmp Exit
    greater:
        lea dx,msg3
        mov ah,09h
        int 21h
        jmp Exit

    less:
        lea dx,msg4
        mov ah,09h
        int 21h
        jmp Exit

    Exit:
        mov ah, 04ch
        int 21h

    main endp
end main


