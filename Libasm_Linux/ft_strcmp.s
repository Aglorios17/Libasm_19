	global ft_strcmp

ft_strcmp:
	xor		rax, rax
	xor 	rdx, rdx				; dl = (char)rdx
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
	and		rdx, 255				; et binaire, limite la taille de rdx
	mov		rsi, [rsi + rax]		; pointer sur l adresse
	and		rsi, 255
	sub		rdx, rsi
	mov		rax, rdx
	ret
