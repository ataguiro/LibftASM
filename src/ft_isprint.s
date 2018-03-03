section .text
	global _ft_isprint

_ft_isprint:
	cmp rdi, 32
	jb fail
	cmp rdi, 126
	ja fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret
