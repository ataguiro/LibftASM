# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_min.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:29 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 16:59:00 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_min

_ft_min:
	cmp rsi, rdi
	jg first
	mov rax, rsi
	ret

first:
	mov rax, rdi
	ret
