# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_sum.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:13:04 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:13:05 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_sum

_ft_sum:
	mov rax, rdi
	add rax, rsi
	ret
