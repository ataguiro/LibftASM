# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:45 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:48 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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

	lea rsi, [rel endl]
	mov rdx, 1
	mov rax, 0x2000004
	syscall
	mov rax, 10
	ret

null_case:
	lea rdi, [rel null]
	jmp back

section .data
	endl db 0xa
	null db "(null)"
