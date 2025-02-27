.model small 
.stack 100h

.data
    nam db 'Name: Haseeb Khan', 13, 10, '$'
    
.code
main proc
        mov ax,@data
        mov ds, ax
        
        lea dx, nam
        mov ah, 09h
        int 21h
        mov ax, 4C00h
        int 21h
        
main endp
end main