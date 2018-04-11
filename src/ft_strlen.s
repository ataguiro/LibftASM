# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/26 17:53:07 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:13:02 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

_ft_strlen:
	xor al, al
	mov rcx, -1
	cld                ; Just to be sure: pointer should be incremented
	repne scasb
	not rcx
	dec rcx
	mov rax, rcx
	ret
