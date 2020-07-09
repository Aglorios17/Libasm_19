	global	ft_read
	extern	__errno_location

ft_read:
	xor		rax, rax
	xor		rcx, rcx
	mov		rax, 0				; prefix syscall pour write
	syscall						; appel d une fonction de l ordinateur (https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)
	mov		rcx, rax
	push	rcx
	cmp		rsi, 0
	je		return
	mov		rax, 72				; valeur du syscall fcntl
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
	call	__errno_location
	pop		rdx
	mov		[rax], rdx
	mov		rax, -1
	ret
