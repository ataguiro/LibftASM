# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:13:06 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:13:07 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_tolower

_ft_tolower:
	cmp rdi, 65
	jb end
	cmp rdi, 90
	ja end
	add rdi, 32

end:
	mov rax, rdi
	ret
