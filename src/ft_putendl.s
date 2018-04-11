# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putendl.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:43 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 15:12:44 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_putendl

extern _ft_putstr

_ft_putendl:
	call _ft_putstr
	lea rdi, [rel endl]
	call _ft_putstr
	ret

section .data
	endl db 0xa
