NAME	:= philo

#Compiler options#

CC		:= cc
CFLAGS	:= -pthread -Wextra -Wall -Werror 
DFLAGS	:= -g -fsanitize=address,undefined

INC_DIR  := ./inc -I
SRC_DIR  := ./src
OBJ_DIR  := .

SRCS	:= 	$(SRC_DIR)/main.c
	
OBJS	:= ${SRCS:.c=.o}

HEADERS := -I ./inc

all: $(NAME)

%.o: %.c
	@$(CC) -o $@ -c $< $(CFLAGS) $(HEADERS) && printf "Compiling: $(notdir $<)\n"
	
		
$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $(OBJS) $(HEADERS) -o $(NAME)

debug: CFLAGS += $(DFLAGS)
debug: clean all

clean:
	@rm -rf $(OBJS)

fclean: clean
	@rm -rf $(NAME)

re: fclean all

.PHONY: all, clean, fclean, re, debug
