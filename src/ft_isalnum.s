# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/28 16:36:14 by ataguiro          #+#    #+#              #
#    Updated: 2018/02/28 16:39:02 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isalnum

extern 

_ft_isalnum:
	cmp rdi, 48
	jb fail
	cmp rdi, 57
	ja fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret
