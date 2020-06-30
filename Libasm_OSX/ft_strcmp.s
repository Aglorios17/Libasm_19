	global _ft_strcmp

_ft_strcmp:
	xor		rax, rax
	xor 	rdx, rdx ; dl = (char)rdx
	cmp		rdi, 0
	je		_return
	cmp		rsi, 0
	je		_return

_loop:
	mov		dl, byte [rdi + rax]  	; donner une valeur
	cmp		byte [rsi + rax], dl
	jne		_return					; non egal
	cmp		dl, 0
	je		_return
	cmp		byte [rsi + rax], 0
	je		_return
	inc		rax
	jmp		_loop

_return:
	cmp		dl, byte [rsi + rax]
	jl		_neg					;	< value
	jg		_pos					;	> value
	mov		rax, 0
	ret

_neg:
	mov		rax, -1
	ret

_pos:
	mov		rax, 1
	ret

