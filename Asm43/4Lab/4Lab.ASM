; Гудимов Денис ПЗ-21-2 варіант 20
; Результаты анкетирования хранятся в массиве А из k (<10) байтов: в сегменте 
; данных определить массив байтов двоичными константами (например, 00010010b).
; Каждый бит соответствует одному ответу: «да» кодируется как 1, «нет» – 0.
; Опре-делить количество анкет с преобладанием положительных ответов.


TITLE lab2


.386
    .model flat, stdcall; директива вибору моделі пам’яті
    option casemap :none; директива повідомляє транслятору, що потрібно розрізняти великі та малі літери
    include masm32.inc; директива вставляє в текст програми вміст файлу MASM32.INC
    include kernel32.inc; директива вставляє в текст програми вміст файлу KERNEL32.INC
    includelib masm32.lib; директива повідомляє лінковщику яку бібліотеку додати до програми
    includelib kernel32.lib
.const
	message_comment	db 10, 'The number of questionnaires with a predominance of positive answers:', 10, 0
.data
	arr DB 00110001b, 00100011b, 01110101b, 01111100b, 01101101b, 01111011b, 11110010b, 01011011b, 00111110b, 11100011b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b, 00011111b
	n = $-arr
	count DB 0
	res DB 0
	x dw ?
.code
_main proc

	MOV ECX, n
	MOV ESI, 0
	cmp ECX,0
	jle skip
	external:
	mov al,arr[esi] 
	PUSH ECX		;заносим ECX в стек
	PUSH ESI		;заносим ESI в стек
	MOV ECX, 8
	MOV ESI, 0
	mov count,0
	inner:
	shr al, 1 
    Jnc skip_inc	; если флаг С 0 не инкрементируем
	inc count
	skip_inc:
	cmp count,4
	jg res_inc
	loop inner
	jmp next
	res_inc:
	inc res			;00111011b, 01101101b, 01111011b
	next:
	POP ESI			;забираемо зі стеку
	POP ECX			;забираемо зі стеку
	add esi, 1
	loop external
	mov al,res
	cbw
	mov x,ax
    invoke StdOut, addr message_comment
	 invoke dwtoa, dword ptr x, addr res
	 invoke StdOut, addr res
	 ;add res,48		; додаесо 48 бо в ascii 0 починаеться з 48+потрібне число
    
    skip:         
    invoke ExitProcess, 0

_main endp
end _main