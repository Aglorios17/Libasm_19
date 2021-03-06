	global _ft_strdup
	extern	_malloc
	extern	_ft_strlen
	extern	_ft_strcpy

_ft_strdup:
	xor		rax, rax
	xor		rsi, rsi
	cmp		rdi, 0
	je		return

loop:
	push	rdi
	call	_ft_strlen
	mov		rdi, rax
	inc		rdi
	call	_malloc
	cmp  	rax, 0
	je		return
	pop		rsi
	mov		rdi, rax
	call	_ft_strcpy
	ret

return:
	mov		rax, -1
	ret
