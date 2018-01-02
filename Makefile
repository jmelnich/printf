# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imelnych <imelnych@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/19 13:18:52 by imelnych          #+#    #+#              #
#    Updated: 2018/01/02 19:01:29 by imelnych         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

TARGET = libftprintf.a
EXC = ft_printf
FLAGS = -Wall -Werror -Wextra
UTILS_DIR = utils
OBJ_DIR	= ./obj
OBJ_DIR_U = ./objUtils
SRC_files = ft_printf.c
UTILS_files = ft_strlen.c
OBJ_files = $(addprefix $(OBJ_DIR)/, $(SRC_files:.c=.o))
OBJ_utils_files = $(addprefix $(OBJ_DIR_U)/, $(UTILS_files:.c=.o))
LIB_AR 	= ar rc $(TARGET) $(OBJ_files) $(OBJ_utils_files)
INC_U = utils.h

all: run

$(OBJ_DIR)/%.o: %.c
	gcc $(FLAGS) -I $(UTILS_DIR) -o $@ -c $<	

$(OBJ_DIR_U)/%.o: $(UTILS_DIR)/%.c
	gcc $(FLAGS) -I $(INC_U) -o $@ -c $<	


run:
	@mkdir -p $(OBJ_DIR)
	@$(MAKE) $(OBJ_files)
	@mkdir -p $(OBJ_DIR_U)
	@$(MAKE) $(OBJ_utils_files)
	@$(LIB_AR)
	ranlib $(TARGET)
	gcc $(FLAGS) -o $(EXC) $(SRC_files) $(TARGET)

clean:
	/bin/rm -rf $(OBJ_DIR) $(OBJ_DIR_U)

fclean: clean
	/bin/rm -rf $(TARGET)

re: fclean all