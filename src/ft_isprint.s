# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isprint.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:25 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:28 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isprint

_ft_isprint:
	cmp rdi, 32
	jb fail
	cmp rdi, 126
	ja fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret
