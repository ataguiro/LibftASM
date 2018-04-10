section .text
	global _ft_strcmp

extern _ft_strlen
extern _ft_max

_ft_strcmp:
	cld
	mov rcx, -1
	repe cmpsb
	dec rdi
	dec rsi
	xor rcx, rcx
	xor r8, r8
	mov cl, byte [rdi]
	mov r8b, byte [rsi]
	mov rax, rcx
	sub rax, r8
	ret
