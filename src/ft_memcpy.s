# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/15 11:51:22 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:35 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memcpy

; void *memcpy(void *restrict dst, const void *restrict src, size_t n);

_ft_memcpy:
	mov r8, rdi
	xor rax, rax
	mov rcx, rdx
	test rdx, rdx
	jz end
	cld           ; Just to be sure
	rep movsb
	movsb

end:
	mov rax, r8
	ret
