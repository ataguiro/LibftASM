# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataguiro <ataguiro@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/15 14:57:28 by ataguiro          #+#    #+#              #
#    Updated: 2018/02/26 17:58:59 by ataguiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ===== Editable =====
NAME	:=	libfts.a
INDEX	:=	1
# ====================

# ===== Standard =====
CC		:=	/Users/ataguiro/.brew/bin/nasm
SFLAGS	:=	-f macho64
SRCDIR	:=	src/
OBJDIR	:=	obj/
INCDIR	:=	include/
SRC		:=	$(SRCDIR)ft_bzero.s \
			$(SRCDIR)ft_strcat.s \
			$(SRCDIR)ft_strlen.s
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
	@printf "$(shell echo 'scale=2;$(INDEX)/1 * 100' | bc)%%"$(EOC)
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
	@rm -f $(NAME) test_bin
	@printf $(RED)"$(NAME) removed\n"$(EOC)

test: all
	@gcc main.c -L. -lfts -o test_bin $(INC)

re: fclean all