	global _ft_strlen

_ft_strlen:						;code descent si pas de je
	xor		rax, rax			;ou en bitshift mettre a 0, rax = valeur de retour
	cmp		rdi, 0 				; cmp = campare, rdi premier parametre (rsi 2eme, rdx, ...)
	je		_return 				; je = jump equal, si compare est egal(tj une comparaison), fonction return

_loop:
	cmp		byte [rdi + rax], 0	; rdi[rax] ? 0 (char *rdi)
	je		_return
	inc		rax 				; inc incrementer
	jmp		_loop 				; jmp = returner a la fonction

_return:
	ret							; return rax
