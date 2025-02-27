.model small
.stack 100h

.data
    prompt db 'Enter a string of digits: $'  ; Prompt message for user input
    result_msg db 0Dh, 0Ah, 'Minimum number is: $' ; Message to display the result
    input_string db 6 dup('$')               ; Array to store the input string (5 digits + '$')
    min_num db ?                             ; Variable to store the minimum number

.code
main proc
    mov ax, @data          ; Load the address of the data segment into AX
    mov ds, ax             ; Initialize the DS register with the data segment address

    ; Display the prompt message
    lea dx, prompt         ; Load the address of the prompt message into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message

    ; Read the input string (up to 5 digits)
    lea di, input_string   ; Load the address of the input_string into DI
    mov cx, 5              ; Maximum length of input (5 digits)
    xor si, si             ; Initialize SI to 0 (for counting characters)

read_loop:
    mov ah, 01h            ; Function 01h - Input a character from the keyboard
    int 21h                ; Call DOS interrupt to get a character
    cmp al, 0Dh            ; Compare with carriage return (Enter key)
    je end_input           ; If Enter key is pressed, jump to end_input
    mov [di], al           ; Store the input character in input_string at DI
    inc di                 ; Increment DI to point to the next position in input_string
    inc si                 ; Increment SI to count the characters entered
    loop read_loop         ; Loop until CX is 0 or Enter is pressed

end_input:
    mov [di], '$'          ; Terminate the string with '$'

    ; Initialize the minimum number with the first digit
    lea si, input_string   ; Load the address of the input_string into SI
    mov al, [si]           ; Load the first character (digit) into AL
    sub al, '0'            ; Convert ASCII digit to a numeric value
    mov min_num, al        ; Store the first digit as the initial minimum

    ; Loop through the string to find the minimum number
    inc si                 ; Move to the next character in the string
    mov cx, 4              ; Number of remaining digits to check

find_min:
        mov al, [si]           ; Load the next character (digit) into AL
        sub al, '0'            ; Convert ASCII digit to a numeric value
        cmp al, min_num        ; Compare current digit with min_num
        jge skip_update        ; If current digit >= min_num, skip update
        mov min_num, al        ; Update min_num with the current digit
        
        skip_update:
        inc si                 ; Move to the next character in the string
    loop find_min          ; Repeat until all digits are checked

    ; Output the minimum number
    lea dx, result_msg     ; Load the address of the result message into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message

    ; Convert the minimum number back to ASCII and display it
    mov al, min_num        ; Load the minimum number into AL
    add al, '0'            ; Convert it to ASCII
    mov dl, al             ; Move it to DL for output
    mov ah, 02h            ; Function 02h - Display character
    int 21h                ; Call DOS interrupt to display the character

    ; Wait for a key press before exiting
    mov ah, 08h            ; Function 08h - Input a character without echo
    int 21h                ; Call DOS interrupt to wait for a key press

    ; Exit program
    mov ah, 4Ch            ; Function 4Ch - Terminate program
    int 21h                ; Call DOS interrupt to exit the program

main endp
end main