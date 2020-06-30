	global ft_strcmp

ft_strcmp:
	xor		rax, rax
	xor 	rdx, rdx ; dl = (char)rdx
	cmp		rdi, 0
	je		return
	cmp		rsi, 0
	je		return

loop:
	mov		dl, byte [rdi + rax]  	; donner une valeur
	cmp		byte [rsi + rax], dl
	jne		return					; non egal
	cmp		dl, 0
	je		return
	cmp		byte [rsi + rax], 0
	je		return
	inc		rax
	jmp		loop

return:
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

