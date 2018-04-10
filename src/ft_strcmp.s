section .text
	global _ft_strcmp

_ft_strcmp:
	cld
	xor rax, rax
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
