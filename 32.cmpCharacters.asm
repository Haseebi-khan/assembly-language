model small
.stack 100h

.data
    prompt1 db 'Enter 1st character (1-digit number): $'  ; Prompt for the first number
    prompt2 db 0Dh, 0Ah, 'Enter 2nd character (1-digit number): $'  ; Prompt for the second number
    low_msg db 0Dh, 0Ah, '1st number is lesser than 2nd number. $'  ; Message if 1st number is less than 2nd
    high_msg db 0Dh, 0Ah, '1st number is greater than 2nd number. $' ; Message if 1st number is greater than 2nd
    found_msg db 0Dh, 0Ah, 'Number is found! $'                     ; Message if the number is guessed correctly
    guess_again db 0Dh, 0Ah, 'Guess again: $'                       ; Prompt to guess again
    char1 db ?                                            ; Variable to store the 1st number
    char2 db ?                                            ; Variable to store the 2nd number

.code
main proc
    mov ax, @data          ; Load the data segment address into AX
    mov ds, ax             ; Initialize DS register with data segment address

    ; Prompt and read the 1st number
    lea dx, prompt1        ; Load the address of prompt1 into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message

    mov ah, 01h            ; Function 01h - Input a character from the keyboard
    int 21h                ; Call DOS interrupt to get the character
    sub al, '0'            ; Convert ASCII to a numerical value
    mov char1, al          ; Store the 1st number in char1

    ; Clear the screen
    mov ax, 0600h          ; Function 06h - Scroll up the window, clear screen
    mov bh, 07h            ; Display page and attribute (white text on black background)
    mov cx, 0              ; Upper-left corner of the screen
    mov dx, 184FH          ; Lower-right corner of the screen (80x25)
    int 10h                ; Call BIOS interrupt to clear the screen

guess_loop:
    ; Prompt and read the 2nd number
    lea dx, prompt2        ; Load the address of prompt2 into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message

    mov ah, 01h            ; Function 01h - Input a character from the keyboard
    int 21h                ; Call DOS interrupt to get the character
    sub al, '0'            ; Convert ASCII to a numerical value
    mov char2, al          ; Store the 2nd number in char2

    ; Compare the two numbers
    mov al, char1          ; Load the 1st number into AL
    cmp al, char2          ; Compare AL (char1) with char2

    je number_found        ; If numbers are equal, jump to number_found
    jl number_low          ; If char1 < char2, jump to number_low
    jg number_high         ; If char1 > char2, jump to number_high

number_low:
    ; Display message: "1st number is lesser than 2nd number."
    lea dx, low_msg        ; Load the address of low_msg into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message
    jmp guess_again_prompt ; Jump to guess again

number_high:
    ; Display message: "1st number is greater than 2nd number."
    lea dx, high_msg       ; Load the address of high_msg into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message
    jmp guess_again_prompt ; Jump to guess again

number_found:
    ; Display message: "Number is found!"
    lea dx, found_msg      ; Load the address of found_msg into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message
    jmp end_program        ; Jump to end_program

guess_again_prompt:
    ; Prompt to guess again
    lea dx, guess_again    ; Load the address of guess_again into DX
    mov ah, 09h            ; Function 09h - Display string
    int 21h                ; Call DOS interrupt to display the message
    jmp guess_loop         ; Jump back to the start of the guess loop

end_program:
    ; Wait for a key press before exiting
    mov ah, 08h            ; Function 08h - Input a character without echo
    int 21h                ; Call DOS interrupt to wait for a key press

    ; Exit program
    mov ah, 4Ch            ; Function 4Ch - Terminate program
    int 21h                ; Call DOS interrupt to exit the program

main endp