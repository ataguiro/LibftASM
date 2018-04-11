# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_max.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:29 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:30 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_max

_ft_max:
	cmp rdi, rsi
	jg first
	mov rax, rsi
	ret

first:
	mov rax, rdi
	ret
