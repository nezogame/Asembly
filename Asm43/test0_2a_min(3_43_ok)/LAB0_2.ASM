; Гудимов Денис ПЗ-21-2 варіант 24
TITLE lab2
N =10

.386
dseg segment para public 'data'

P1 DB 100,-57,12,45,2 
P2 DD -255
P3 DB  4*8+16/2,N*3         
P4 DB  "12 tango" 
P5 DW 78H,0F1FAH,4DCFH,000FH,-1A38H  
P6 DD 9574, -9574


dseg ends
sseg segment para stack 'stack'
    dw 64 dup(?)
sseg ends
cseg segment para public 'code'
_main proc far
    assume ds:dseg, cs:cseg, ss:sseg

    push ds
    sub ax,ax
    push ax
   
    MOV AX, CX	;1) PW,PW 
	;MOV ES,DS			
		MOV AX, DS	;2) PS,PW 
		MOV ES, AX
	MOV P2,40	;3) П,HC
    MOV P2,EAX	;4) П,PW 
	
	;MOV ES,[EBX]
	MOV EBX, offset P5+6 	;5) PS,KP 
	
		mov AX,[EBX]
		;mov ES, AX  проблеми з сегментом ES
    	
	MOV AX, DS	;6) PW,PS
		
   
   
;	MOV	CX, -17H
;	MOV	P3,-17
;	MOV	AL, CL
;;MOV ES, DS
;	MOV AX, DS
;	MOV ES, AX
;	
;	MOV AL, P5
;        LEA ESI, P5
;        mov BL, [ESI]
;	MOV P6, "V"
;	MOV P6, 'a'
;	MOV P6, 250
	ret
_main ENDP
cseg	ends
	END _main