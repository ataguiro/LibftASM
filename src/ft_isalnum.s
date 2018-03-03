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

extern _ft_isalpha
extern _ft_isdigit

_ft_isalnum:
	call _ft_isalpha
	test rax, rax
	jnz success
	call _ft_isdigit
	test rax, rax
	jnz success
	xor rax, rax
	ret

success:
	mov rax, 1
	ret
