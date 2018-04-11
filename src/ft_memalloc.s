# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memalloc.s                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:02:25 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:34:29 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memalloc

extern _malloc
extern _ft_bzero

_ft_memalloc:
	inc rdi
	push rdi
	call _malloc
	test rax, rax
	jz end

	mov rdi, rax
	pop rsi
	call _ft_bzero
end:
	ret
