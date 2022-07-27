# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/27 01:36:53 by lcouto            #+#    #+#              #
#    Updated: 2022/07/27 01:55:20 by lcouto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_containers

INCLUDES = -I containers

CC	= clang++

RM	= rm -rf

CFLAGS	= -Wall -Wextra -Werror -g -std=c++98

DIR_TEST	=	test
DIR_BUILD	=	build

TESTS		=	$(DIR_TEST)/main.cpp \

BUILD		=	$(subst $(DIR_TEST), $(DIR_BUILD), $(TESTS:.cpp=.o))

ifeq ($(SANITIZE_A),true)
	CFLAGS += -fsanitize=address -fno-omit-frame-pointer
endif

ifeq ($(SANITIZE_L),true)
	CFLAGS += -fsanitize=leak -fno-omit-frame-pointer
endif

$(NAME): $(BUILD)
		@-$(CC) $(CFLAGS) $(BUILD) -o $(NAME)
		@echo "created $(NAME) executable file successfully!"

$(DIR_BUILD)/%.o	:	$(DIR_TEST)/%.cpp
			@mkdir -p $(DIR_BUILD)
			@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
			@echo "Compiled "$<" successfully!"

all: $(NAME)

clean:
		@$(RM) $(BUILD)
		@$(RM) -r $(DIR_BUILD)
		@echo "Cleanup completed!"

fclean:	clean
		@$(RM) $(NAME)
		@$(RM) $(BUILD)
		@$(RM) -r $(DIR_BUILD)

re:		fclean all

PHONY:	all clean fclean re
