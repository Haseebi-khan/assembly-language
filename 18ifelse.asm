.model small
.stack 100h

.data
    x db 5
    y db 10
    z db 20
    result db 0

.code
main proc
    mov ax, @data
    mov ds, ax
    mov bl,x
    CMP bl,y
    JL firstCheck

            mov al, result
            add al, x
            add al, y
            mov result, al
            JMP Endcase

    firstCheck:
    
        mov bl,y
        CMP bl,z
        JL secondCheck

            mov al, result
            add al, x
            add al, y
            mov result, al
            JMP Endcase

        secondCheck:
        mov al, z
        sub al, y
        mov result, al 
        JMP Endcase  



    
    Endcase: 

    mov dl, result
    add dl, '0'  
    mov ah, 02h
    int 21h 

    mov ah, 4Ch
    int 21h

main endp
end main