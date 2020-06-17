	global	_ft_write

_ft_write:
	mov		rax, 0x2000004		; prefix syscall pour write
	syscall						; appel d une fonction de l ordinateur (https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)
	jc		_return				; si write fonctionne pas error
	ret

_return:
	mov		rax, -1
	ret
