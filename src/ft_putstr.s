# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putstr.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:12:49 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/11 16:23:37 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_putstr

extern _ft_strlen

; write(1, rsi, strlen(rdi))

_ft_putstr:
	test rdi, rdi
	jz end

	mov rsi, rdi
	call _ft_strlen
	mov rdi, 1
	mov rdx, rax
	mov rax, 0x2000004 ; write syscall
	syscall
end:
	ret
