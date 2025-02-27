.model small
.stack 100h

.data
    msg1 db "Enter string : $"
    input db 13,10, 20 dup('$')
    
.code
main proc
    mov ax, @data
    mov ds, ax


    lea dx, msg1   ; Enter number which table you want to print:
    mov ah, 09h
    int 21h
                     
    mov ah, 10h      ; user input
    int 21h          ;suppose
    
    mov input,ax

    lea dx,input +2
    mov ah,09h
    int 21h

    
    mov ah, 4Ch
    int 21h

main endp
end main