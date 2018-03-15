# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/15 11:51:22 by ataguiro          #+#    #+#              #
#    Updated: 2018/03/15 11:55:20 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memcpy

; void *memcpy(void *restrict dst, const void *restrict src, size_t n);

_ft_memcpy:
	cld           ; Just to be sure
	rep movsb
	ret
