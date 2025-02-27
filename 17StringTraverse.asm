.model small
.stack 100h

.data
    string db "askdjlksadj", 0
    
    
.code
main proc
    mov ax, @data
    mov ds, ax


    lea si, string

    stringLoop:

        mov al,[si]
        cmp al, 0
        je  done

        mov dl,al
        mov ah,02h
        int 21h

        inc si

        jmp stringLoop
    
    done:

        mov ah, 4Ch
        int 21h

main endp
end main