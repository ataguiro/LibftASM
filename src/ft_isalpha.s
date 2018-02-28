# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/28 16:05:38 by ataguiro          #+#    #+#              #
#    Updated: 2018/02/28 16:18:26 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isalpha

_ft_isalpha:
	cmp rdi, 65
	jb fail
	cmp rdi, 122
	ja fail
	cmp rdi, 90
	ja check
	jmp success

check:
	cmp rdi, 97
	jb fail
	jmp success

fail:
	xor rax, rax
	ret

success:
	mov rax, 1
	ret
