# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/26 15:06:44 by ataguiro          #+#    #+#              #
#    Updated: 2018/02/26 15:08:02 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_bzero

_ft_bzero:
	test rsi, rsi
	jz end

until_zero:
	mov byte [rdi], 0
	inc rdi
	dec rsi
	jnz until_zero

end:
	ret
