	global ft_strlen

ft_strlen:						;code descent si pas de je
	xor		rax, rax			;ou en bitshift mettre a 0, rax = valeur de retour
	cmp		rdi, 0 				; cmp = campare, rdi premier parametre (rsi 2eme, rdx, ...)
	je		return 				; je = jump equal, si compare est egal(tj une comparaison), fonction return

loop:
	cmp		byte [rdi + rax], 0	; rdi[rax] ? 0 (char *rdi)
	je		return
	inc		rax 				; inc incrementer
	jmp		loop 				; jmp = returner a la fonction

return:
	ret							; return rax
