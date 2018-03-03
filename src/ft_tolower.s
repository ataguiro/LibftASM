section .text
	global _ft_tolower

_ft_tolower:
	cmp rdi, 65
	jb end
	cmp rdi, 90
	ja end
	add rdi, 32

end:
	mov rax, rdi
	ret
