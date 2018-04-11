# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:51 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:53 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcat

_ft_strcat:
	mov r8, rdi
	xor al, al
	mov rcx, -1
	repne scasb
	dec rdi
	mov rdx, rdi
	mov rdi, rsi

	mov rcx, -1
	repne scasb
	not rcx
	dec rcx
	mov rdi, rdx
	rep movsb
	mov byte [rdi], 0

	mov rax, r8
	ret
