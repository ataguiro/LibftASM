# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/22 18:59:09 by ataguiro          #+#    #+#              #
#    Updated: 2018/03/25 18:16:12 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_cat

_ft_cat:
	pop r9
	mov r8, rdi         ; rcx = fd
	mov rsi, rsp

loop:
	mov rdi, r8
	mov rdx, 4096
	mov rax, 0x2000003   ; read syscall number
	syscall

	test rax, rax
	jz end

	mov rdi, 1
	mov rdx, rax
	mov rax, 0x2000004   ; write syscall number
	syscall
	jmp loop

end:
	xor rax, rax
	push r9
	ret
