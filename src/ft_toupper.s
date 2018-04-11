# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:13:09 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:13:10 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 97
	jb end
	cmp rdi, 122
	ja end
	sub rdi, 32

end:
	mov rax, rdi
	ret
