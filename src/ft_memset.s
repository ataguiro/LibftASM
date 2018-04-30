# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/11 16:00:04 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/19 15:59:31 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memset

_ft_memset:
	push rdi
	test rdx, rdx
	jz end
	cld
	mov rcx, rdx
	mov rax, rsi
	rep stosb

end:
	pop rax
	ret
