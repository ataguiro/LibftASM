# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isin.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:22 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:23 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isin

_ft_isin:
	mov dl, byte [rsi]
	test dl, dl
	jz bad
	cmp dl, dil
	je good
	inc rsi
	jmp _ft_isin

good:
	mov rax, 1
	ret

bad:
	xor rax, rax
	ret
