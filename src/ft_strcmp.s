section .text
	global _ft_strcmp

extern _ft_strlen
extern _ft_max

_ft_strcmp:
	push rdi
	push rsi
	call _ft_strlen
	push rax
	mov rdi, rsi
	call _ft_strlen
	push rax
	pop rdi
	pop rsi
	call _ft_max
	mov rcx, rax
	pop rsi
	pop rdi

	cld
	xor rax, rax
	xor r8, r8
	xor r9, r9
	repe cmpsb
	jne fail
	ret

fail:
	dec rsi
	dec rdi
	mov r8b, byte [rdi]
	mov r9b, byte [rsi]
	add rax, r8
	sub rax, r9
	ret
