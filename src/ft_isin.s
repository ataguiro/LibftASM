section .text
	global _ft_isin

_ft_isin:
	mov dl, byte [rsi]
	test dl, dl
	jz bad
	cmp dl, dil
	je good
	inc rsi
	jmp _ft_isin

good:
	mov rax, 1
	ret

bad:
	xor rax, rax
	ret
