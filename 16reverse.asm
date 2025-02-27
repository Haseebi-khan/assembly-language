.model small
.stack 100h

.data
    msg1 db "Enter Charactor: $"
    character db ?
    column db 1
.code
main proc
    mov ax, @data
    mov ds, ax


    lea dx, msg1   ; Enter number which table you want to print:
    mov ah, 09h
    int 21h
                     
    mov ah, 01h      ; user input
    int 21h          ;suppose
    
    mov character, al

    ;setting postion of the table
    mov ah, 02h   ;curser position
    mov bh, 00    ;page num
    mov dh,03     ;row
    mov dl,00     ;colon
    mov column, dl
    int 10h

    mov cx, 10 
    chaaaaar:

        mov dl,character
        mov ah, 02h
        int 21h
        
        sub character, 1

            mov dh,03     ;row
            add column, 1 
            mov dl,column  ;colon
            int 10h


    loop chaaaaar


    
    mov ah, 4Ch
    int 21h

main endp
end main