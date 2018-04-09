section .text
	global _ft_putendl

extern _ft_putstr

_ft_putendl:
	call _ft_putstr
	lea rdi, [rel endl]
	call _ft_putstr
	ret

section .data
	endl db 0xa
