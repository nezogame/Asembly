; Гудимов Денис ПЗ-21-2 варіант 37
; 
; mx^2+n,  x>10
; (m+n)*x, 5<x<=10
; m^2+n^2, x<=5 

TITLE lab2


.386
dseg segment para public 'data'

	n EQU 6
	arr DW 7,-3,14,1,0,11
	count DB n dup(-1)
	a DB 2
	b DB 6
	y DW n dup (?)


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
	
	MOV ECX, N
	MOV ESI, 0
	jecxz skip
	start:
	cmp [arr+esi],10	 
	jg first	;
	cmp [arr+esi],5
	jg second ;=
	;tird
	mov al, a	; al = 2, 2, 2
	imul a 		; ax = 4, 4, 4
	
	mov bx,ax
	mov al, b	; al = 6, 6, 6
	imul b 		; ax = 36, 36, 36
	
	add ax,bx	; 40,40,40,40
 	jmp next
	first:
		mov al, a	; al = 2
		cbw
		imul [arr+esi]	; al = 22
		imul [arr+esi]	; al = 242
		movsx bx,b
		add ax,bx	; al = 248
	jmp next
	second:
		mov al,a 	;al = 2
		add al,b	;al = 2+6=8
		cbw
		imul [arr+esi]	;al = 8*7=56
		
	next:
	mov [y+esi],ax	  ; 56, 40, 40, 40, 40, 248
	add esi, 2   ;збільшуємо на 2, бо масив розміром DW
	loop start 
	skip:
	ret
_main ENDP
cseg	ends
	END _main