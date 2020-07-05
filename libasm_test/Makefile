# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cacharle <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/08 03:06:59 by cacharle          #+#    #+#              #
#    Updated: 2020/04/12 20:12:48 by charles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM = rm -f
UNAME = $(shell uname)

ifeq ($(UNAME), Linux)
	PYTHON = python3.7
else
	PYTHON = python3
endif

LIBASM_PATH = ../libasm

CC = gcc
CCFLAGS = -I. -Wall -Wextra
LDFLAGS = -L$(LIBASM_PATH) -lasm

NAME = runtest
SRC = main.c \
	  helper.c \
	  helper_list.c \
	  test/ft_strlen_test.c \
	  test/ft_strcpy_test.c \
	  test/ft_strcmp_test.c \
	  test/ft_write_test.c \
	  test/ft_read_test.c \
	  test/ft_strdup_test.c \

OBJ = $(SRC:.c=.o)

run: pretty
runbonus: prettybonus

prettybonus: allbonus pretty
pretty: all
	./$(NAME) 2> /dev/null | $(PYTHON) prettier.py

run_rawbonus: allbonus run_raw
run_raw: all
	./$(NAME) 2> /dev/null

run_debugbonus: allbonus run_debug
run_debug: all
	./$(NAME)

all: $(NAME)

$(NAME): libasm_all $(OBJ)
	$(CC) -no-pie  -o $@ $(OBJ) $(LDFLAGS)

%.o: %.c
	$(CC) -no-pie $(CCFLAGS) -c -o $@ $<

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: libasm_fclean libasm_all fclean all


libasm_all:
	make -C $(LIBASM_PATH) all

libasm_fclean:
	make -C $(LIBASM_PATH) fclean
