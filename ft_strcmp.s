	global ft_strcmp

ft_strcmp:
	push	r12						; recuperer les registres r12 et 13 pour passer en unsigned et donc unixcode
	push	r13
	xor		rax, rax
	xor 	rdx, rdx				; dl = (char)rdx
	mov		r12, rdi
	mov		r13, rsi
	cmp		r12, 0
	je		return
	cmp		r13, 0
	je		return

loop:
	mov		dl, byte [r12 + rax]  	; donner une valeur
	cmp		byte [r13 + rax], dl
	jne		return					; non egal
	cmp		dl, 0
	je		return
	cmp		byte [r13 + rax], 0
	je		return
	inc		rax
	jmp		loop

return:
	cmp		dl, byte [r13 + rax]
	pop		r13						; pop en dernier le premier push
	pop		r12
	jl		neg						;	< value
	jg		pos						;	> value
	mov		rax, 0
	ret

neg:
	mov		rax, -1
	ret

pos:
	mov		rax, 1
	ret

