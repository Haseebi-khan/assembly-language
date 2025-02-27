.model small
.stack 100h
.data 

.code
    main   proc
        mov bl, 1 ; store 1 in Base reg
        mov cl, 2 ; Store 2 in code reg

        add bl,cl ; add destination, source

        ;add 48 to print the exist value for 3 in assci
        add bl,48

        mov dl,bl
        mov ah, 2
        int 21h


    main endp
end main