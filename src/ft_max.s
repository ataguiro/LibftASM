section .text
	global _ft_max

_ft_max:
	cmp rdi, rsi
	jg first
	mov rax, rsi
	ret

first:
	mov rax, rdi
	ret
