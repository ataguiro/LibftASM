# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/15 13:00:41 by ataguiro          #+#    #+#              #
#    Updated: 2018/03/16 19:14:53 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strdup

extern _malloc
extern _ft_strlen
extern _ft_memcpy

_ft_strdup:
	sub rsp, 8

	mov rsi, rdi
	call _ft_strlen
	mov rdi, rax
	call _malloc
	mov rdx, rdi
	mov rdi, rax
	call _ft_memcpy
	ret
