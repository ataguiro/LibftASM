section .text
	global _ft_puts

extern _ft_strlen

; write(1, rdi, strlen(rdi))

_ft_puts:
	call _ft_strlen
	mov rdi, 1
	mov rsi, rdi
	mov rdx, rax
	mov r8, rax
	mov rax, 0x2000004 ; write syscall
	syscall

	mov rsi, endl
	mov rax, 0x2000004
	syscall
	add rax, r8
	ret

section .data
	endl db 0xa
