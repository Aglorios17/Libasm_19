	global	_ft_read
	extern	___error

_ft_read:
	xor		rax, rax
	xor		rcx, rcx
	mov		rax, 0x2000003		; prefix syscall pour write
	syscall						; appel d une fonction de l ordinateur (https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)
	mov		rcx, rax
	push	rcx
	cmp		rsi, 0
	je		return
	mov		rax, 0x200005c		; valeur du syscall fcntl
	push	rsi
	mov		rsi, 1				; valeur du define getfd
	syscall						; checker le fd
	pop		rsi
	cmp		rax, 0				; 0 egal absence d erreur fd
	jne		return				; si c est pas egal a 0
	pop		rcx
	mov		rax, rcx
	ret

return:
	pop		rcx
	xor		rdx, rdx
	mov		rdx, rax
	push	rdx
	call	___error
	pop		rdx
	mov		[rax], rdx
	mov		rax, -1
	ret
