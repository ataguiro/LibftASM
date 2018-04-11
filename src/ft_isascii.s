# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:16 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:18 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isascii

_ft_isascii:
	cmp rdi, 0
	jb fail
	cmp rdi, 127
	ja fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret
