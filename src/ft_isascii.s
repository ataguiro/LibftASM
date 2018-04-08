section .text
	global _ft_isascii

_ft_isascii:
	cmp rdi, 0
	jb fail
	cmp rdi, 127
	ja fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret
