# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/15 13:00:41 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/19 14:40:38 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strdup

extern _malloc
extern _ft_strlen
extern _ft_memcpy

; In this function, rep instructions are implicit
; since they are used in _ft_strlen and _ft_memcpy which are
; called in this function

_ft_strdup:
	push rbp
	mov rbp, rsp

	push rdi
	call _ft_strlen
	push rax
	mov rdi, rax
	inc rdi
	call _malloc
	push rax
	pop rdi
	pop rdx
	pop rsi
	call _ft_memcpy
	leave
	ret
