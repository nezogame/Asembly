; Гудимов Денис ПЗ-21-2 варіант 24
; Обчислити значення виразу:
; y=(x^3+a^3)/(8b+1) + (ax^3)/(3)-ax

TITLE lab2


.386
dseg segment para public 'data'

	a DB -4
	b DB 6
	d DB 2
	x DW -3
	y DW 0



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
   ;8b+1
   mov al,8 	;al=8
   imul b  		;ax=8*6=48
   inc ax 		;ax=48+1=49
   mov bx ,ax 	;bx=49
   ;x^3+a^3
   mov ax,x 	;ax= -3
   imul x		;dx:ax=x*x=9
   imul x		;dx:ax=x*x*x=-27
   mov y,ax 	;y=-27
 
   mov al,a 	;al= -4
   cbw			;ax= -4
   mov cx, ax
   mov al, a
   imul al		;dx:ax=a*a=16
   imul cx	;dx:ax=a*a*a=-64

   ;(x^3+a^3)/(8b+1)
   add ax,y		;y=(-27)+(-64)=-91
   cwd
   idiv bx		;-91/49 ax=-1,dx=13
   ;ax^3
   mov y,ax  	;y=-1	
   
   mov al,a 	;al= -4
   cbw			;ax= -4
   imul x		;dx:ax=a*x=12
   imul x		;dx:ax=a*x*x=-36
   mov bx,3		;bx=3
   ;(ax^3)/(3)
   idiv bx		;-36/3 ax=-12 dx=0
   add y,ax		;y=-1+(-12)=-13
   ;ax
   mov al,a		;al=-4
   cbw			;ax=-4
   imul	x		;dx:ax=a*x=12
   ;(x^3+a^3)/(8b+1) + (ax^3)/(3)-ax
   sub y,ax		;y=(-13)-12=-25
   
   
	ret
_main ENDP
cseg	ends
	END _main