section .text
	global _ft_puts

extern _ft_strlen

; write(1, rsi, strlen(rdi))

_ft_puts:
	test rdi, rdi
	jz null_case

back:
	mov rsi, rdi
	call _ft_strlen
	mov rdi, 1
	mov rdx, rax
	mov rax, 0x2000004 ; write syscall
	syscall

	mov rsi, endl
	mov rdx, 1
	mov rax, 0x2000004
	syscall
	mov rax, 10
	ret

null_case:
	mov rdi, null
	jmp back

section .data
	endl db 0xa
	null db "(null)", 0xa
