# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <ataguiro@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/15 14:57:28 by ataguiro          #+#    #+#              #
#    Updated: 2018/04/19 15:03:47 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ===== Editable =====
NAME	:=	libfts.a
INDEX	:=	1
# ====================

# ===== Standard =====
CC		:=	nasm
SFLAGS	:=	-f macho64
SRCDIR	:=	src/
OBJDIR	:=	obj/
INCDIR	:=	include/
SRC		:=	$(SRCDIR)ft_bzero.s \
			$(SRCDIR)ft_strcat.s \
			$(SRCDIR)ft_memalloc.s \
			$(SRCDIR)ft_strlen.s \
			$(SRCDIR)ft_strcmp.s \
			$(SRCDIR)ft_isalpha.s \
			$(SRCDIR)ft_isdigit.s \
			$(SRCDIR)ft_isalnum.s \
			$(SRCDIR)ft_isprint.s \
			$(SRCDIR)ft_isascii.s \
			$(SRCDIR)ft_toupper.s \
			$(SRCDIR)ft_tolower.s \
			$(SRCDIR)ft_max.s \
			$(SRCDIR)ft_min.s \
			$(SRCDIR)ft_puts.s \
			$(SRCDIR)ft_putstr.s \
			$(SRCDIR)ft_putendl.s \
			$(SRCDIR)ft_memset.s \
			$(SRCDIR)ft_memcpy.s \
			$(SRCDIR)ft_strdup.s \
			$(SRCDIR)ft_putchar.s \
			$(SRCDIR)ft_isin.s \
			$(SRCDIR)ft_sum.s \
			$(SRCDIR)ft_strchr.s \
			$(SRCDIR)ft_cat.s
OBJ		:=	$(SRC:$(SRCDIR)%.s=$(OBJDIR)%.o)
INC		:=	-I./$(INCDIR)
CACHEF	:=	.cache_exists
# ====================

# ====== Colors ======
CLEAR		= "\033[2K"
UP			= "\033[A"
EOC			= "\033[0;0m"
BLACK		= "\033[0;30m"
RED			= "\033[0;31m"
BRED		= "\033[1;31m"
GREEN		= "\033[0;32m"
BGREEN		= "\033[1;32m"
YELLOW		= "\033[0;33m"
BLUE		= "\033[0;34m"
PURPLE		= "\033[0;35m"
CYAN		= "\033[0;36m"
WHITE		= "\033[0;37m"
# ====================

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJ) $(SRC)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "\033[1;32m" "\n✓ $@ ok ;)" "\033[0m"

$(OBJDIR)%.o: $(SRCDIR)%.s $(CACHEF)
	@$(CC) $(SFLAGS) $< -o $@ $(INC)
	@printf "\r"
	@printf $(BGREEN)"[ compiling $(NAME)... ] "
	@printf "$(shell echo 'scale=2;$(INDEX)/25 * 100' | bc)%%"$(EOC)
	@$(eval INDEX=$(shell echo $$(($(INDEX)+1))))

$(CACHEF):
	@test -d $(OBJDIR) || mkdir $(OBJDIR)
	@test -d $(CACHEF) || touch $(CACHEF)

%.c:
	@printf $(RED)"Missing file : $@\n"$(EOC)

clean:
	@rm -rf $(OBJDIR) $(CACHEF) test_bin
	@printf $(YELLOW)"All objects removed\n"$(EOC)

fclean: clean
	@rm -f $(NAME) test_bin test_file_ft_cat.txt
	@printf $(RED)"$(NAME) removed\n"$(EOC)

test: all
	@gcc main.c -L. -lfts $(INC) -o test_bin

re: fclean all
