.model small
.stack 100h

.data
    number dw 0   ; Storage for the input binary number

.code
main proc
    ; Initialize the data segment registers
    mov ax, @data
    mov ds, ax
    mov es, ax

    call BinaryInput   ; Read binary input into variable 'number'
    
    ; Print newline after input
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    
    call BinaryOutput  ; Output the binary representation of 'number'

    ; Exit to the operating system
    mov ax, 4C00h
    int 21h
main endp

;-------------------------------------
; BinaryInput:
;   Reads characters ('0' or '1') from the keyboard until Enter (CR) is pressed.
;   Accumulates the binary number in BX and then stores it in the variable 'number'.
;-------------------------------------
BinaryInput proc
    xor bx, bx         ; Clear BX to accumulate the binary number
read_loop:
    mov ah, 01h        ; Read character
    int 21h            ; AL = character
    cmp al, 13         ; Check for Enter
    je finish_input
    sub al, '0'        ; Convert to binary
    cmp al, 0          ; Validate input is 0 or 1
    jb invalid_input
    cmp al, 1
    ja invalid_input
    shl bx, 1          ; Shift BX left
    or bx, ax          ; Add the new bit to BX (corrected from 'or bl, al')
    jmp read_loop
invalid_input:
    ; Optionally handle invalid input (e.g., beep, message)
    jmp read_loop      ; Ignore and continue
finish_input:
    mov number, bx     ; Store the result
    ret
BinaryInput endp

;-------------------------------------
; BinaryOutput:
;   Outputs the 16-bit binary representation of the number stored in 'number'.
;   It uses the ROL instruction so that the most-significant bit goes into CF.
;-------------------------------------
BinaryOutput proc
    mov ax, number     ; Load the number to be printed
    mov cx, 16         ; We want to output 16 bits
output_loop:
    rol ax, 1          ; Rotate left; MSB goes into CF
    jc print_one       ; If CF is set, the bit is 1
    ; Otherwise, print '0'
    mov dl, '0'
    jmp print_char
print_one:
    mov dl, '1'
print_char:
    mov ah, 02h        ; Function 02h: Write character in DL to STDOUT
    int 21h
    loop output_loop
    ret
BinaryOutput endp

end main