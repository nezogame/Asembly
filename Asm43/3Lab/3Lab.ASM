; Гудимов Денис ПЗ-21-2 варіант 24
; 
; min(a,b,c), x<=0
; (a+b+c)*x,  x>0

TITLE lab2

.386
.MODEL flat, stdcall

.STACK 4096
option casemap :none
include masm32.inc
include kernel32.inc
includelib masm32.lib
includelib kernel32.lib

.data
	mass db 00101010b, 11010000b, 10101010b, 00001111b, 11011101b, 10010010b, 01111111b, 01100110b, 11111111b
	LEN = $-mass
	csumm DB 0
	EXP = 5
	ystr DB 'Yes', 0
	nstr DB 'No', 0

.code
	_main PROC

	MOV ECX, LEN
	CMP ECX, 0
	JLE EXIT
	MOV ESI, 0

	go:

	MOVSX AX, mass[ESI*TYPE mass]
	BT AX, 4
	jnc NEXT
	INC csumm

	NEXT: INC ESI
	loop go

	CMP csumm, EXP
	jne n
	; yes
	INVOKE StdOut, OFFSET ystr
	
	jmp EXIT
	n:
	; no
	INVOKE StdOut, OFFSET nstr

EXIT: 
INVOKE StdIn, OFFSET csumm, 1
ret
_main ENDP
	END _main