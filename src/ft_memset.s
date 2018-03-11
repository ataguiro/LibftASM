# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/11 16:00:04 by ataguiro          #+#    #+#              #
#    Updated: 2018/03/11 17:01:38 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memset

_ft_memset:
	mov rax, rdi
loop:
	test rdx, rdx
	jz end
	mov byte [rdi], sil
	inc rdi
	dec rdx
	jne loop

end:
	ret
