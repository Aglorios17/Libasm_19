	global	_ft_read

_ft_read:
	mov		rax, 0x2000003
	syscall
	jc		_return
	ret

_return:
	mov		rax, -1
	ret
