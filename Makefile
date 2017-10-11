# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abrichar <abrichar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/04 07:22:10 by abrichar          #+#    #+#              #
#    Updated: 2017/10/11 17:06:31 by abrichar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CFLAG = -Wall -Wextra -Werror
CPPFLAGS = -Iincludes/

SRC_NAME = ft_printf.c ft_printf_parser.c ft_printf_core.c ft_c.c ft_smaj.c \
	ft_percent.c ft_s.c ft_unicode.c ft_l.c ft_oux.c ft_x.c \
	ft_invalid_input.c ft_o.c ft_p.c
OBJ_NAME = $(SRC_NAME:.c=.o)

SRC_PATH = src
OBJ_PATH = obj
INC_PATH = includes

SRC = $(addprefix $(SRC_PATH)/, $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH)/, $(OBJ_NAME))
LIBFT = libft/libft.a

all: $(NAME)

$(NAME): $(OBJ)
	cd libft; $(MAKE) -f Makefile
	ar rcs $(NAME) $^ $(LIBFT)

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@gcc $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

clean:
	@rm -rf $(OBJ_PATH)

fclean: clean
	@rm -f $(NAME)

re: fclean all
