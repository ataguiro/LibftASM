section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 97
	jb end
	cmp rdi, 122
	ja end
	sub rdi, 32

end:
	mov rax, rdi
	ret
