.model small

.stack 0x100

.data

	ask db 10, 13, 'Enter number between (0 - 255): $'

	reply db 10, 13, 'Output: $'

	number dw ? 

	count db ? 

.code

	main proc

		mov AX, @data
		mov DS, AX

		call InDec
		call OutDec

		mov AH, 1
		int 0x21

		mov AH, 0x4C
		int 0x21

	main endp

	InDec proc

		push AX
		push BX
		push CX
		push DX

		reask:

		mov AH, 9
		lea DX, ask
		int 0x21

		mov number, 0
		mov BL, 10

		beginloop:

		mov AH, 1
		int 0x21

		mov CH, 0 

		cmp AL, 10
		je endloop
		cmp AL, 13
		je endloop

		cmp AL, '0'
		jb reask
		cmp AL, '9'
		ja reask

		; number = 10 * number + CX
		mov CL, AL
		sub CL, '0'
		mov AX, number
		mul BL
		add AX, CX
		mov number, AX

		jmp beginloop

		endloop:

		pop DX
		pop CX
		pop BX
		pop AX
		ret

	InDec endp

	OutDec proc

		push AX
		push BX
		push CX
		push DX

		mov AH, 9
		lea DX, reply
		int 0x21

		mov BL, 10
		mov CX, number
		mov count, 0

		beginaddstack:
		cmp CX, 0
		je endaddstack
		inc count
		mov AX, CX
		div BL
		mov CX, AX
		mov CH, 0
		push AX
		jmp beginaddstack
		endaddstack:

		mov AH, 2

		begindisplay:
		cmp count, 0
		je enddisplay
		dec count
		pop CX
		mov DL, CH
		add DL, '0'
		int 0x21
		jmp begindisplay
		enddisplay:

		pop DX
		pop CX
		pop BX
		pop AX
		ret

	OutDec endp