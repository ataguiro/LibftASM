# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strchr.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 17:07:47 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 17:29:01 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strchr

extern _ft_strlen

_ft_strchr:
	push rdi
	call _ft_strlen
	pop rdi
	add rax, 2
	mov rcx, rax
	mov rax, rsi
	repne scasb
	test rcx, rcx
	jz not_found
	dec rdi
	mov rax, rdi
	ret

not_found:
	xor rax, rax
	ret
