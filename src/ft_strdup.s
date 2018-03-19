# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/15 13:00:41 by ataguiro          #+#    #+#              #
#    Updated: 2018/03/19 17:56:04 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strdup

extern _malloc
extern _ft_strlen
extern _ft_memcpy

_ft_strdup:
	push rbp
	mov rbp, rsp

	push rdi
	call _ft_strlen
	push rax
	mov rdi, rax
	call _malloc
	push rax
	pop rdi
	pop rdx
	pop rsi
	call _ft_memcpy
	leave
	ret
