section .text
	global _ft_puts

extern _ft_strlen

; write(1, rsi, strlen(rdi))

_ft_puts:
	mov rsi, rdi
	call _ft_strlen
	mov rdi, 1
	mov rdx, rax
	mov r8, rax
	mov rax, 0x2000004 ; write syscall
	syscall

	mov rsi, endl
	mov rdx, 1
	mov rax, 0x2000004
	syscall
	add rax, r8
	ret

section .data
	endl db 0xa
