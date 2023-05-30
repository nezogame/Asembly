TITLE lab2

.386
.MODEL flat, stdcall
.STACK 4096

.data
P1	DB	'text for example$'
P2	DW	'Ok','No','Ye','s '
P3	DW	3 DUP (15, 0, -24), 2 DUP (37), 4 DUP ('a')
P4	DB	-24
P5	DB	15, -56, 24, 12D, 5, -5, 5D
P6	DB	?
.code
_main PROC
	MOV	CX, -17H
	MOV	P3,-17
	MOV	AL, CL

;MOV ES, DS
	MOV AX, DS
	MOV ES, AX

	MOV AL, P5
 	LEA ESI, P5
        mov BL, [ESI]
	MOV P6, "V"
	MOV P6, 'a'
	MOV P6, 250
	ret
_main ENDP
	END _main