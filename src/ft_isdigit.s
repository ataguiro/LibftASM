# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/28 16:28:39 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:20 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isdigit

_ft_isdigit:
	cmp rdi, 48
	jb fail
	cmp rdi, 57
	ja fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret
