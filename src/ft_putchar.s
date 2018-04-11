# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putchar.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:39 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:42 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_putchar

_ft_putchar:
	; prologue
	push rbp
	mov rbp, rsp

	push rdi
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 1
	mov rax, 0x2000004 ; write syscall
	syscall

	; epilogue
	leave
	ret
