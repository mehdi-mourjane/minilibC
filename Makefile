##                                                                                            
## EPITECH PROJECT, 2021                                                                      
## makefile                                                                                   
## File description:                                                                          
## makefile                                                                                   
##                                                                                            

NAME	=	libasm.so

ASM	=	nasm

CC	=	gcc

SRC	=	src/strlen.asm	\
		src/strchr.asm	\
        src/memset.asm	\
		src/memcpy.asm	\
		src/strcmp.asm	\
		src/strncmp.asm	\
		src/memmove.asm	\
		src/strstr.asm	\
		src/rindex.asm	\
		src/strpbrk.asm	\
		src/strcasecmp.asm	\
		src/strcspn.asm	\

OBJ	=	$(SRC:.asm=.o)

CFLAGS	=	-fPIC -Wall -Wextra

LDFLAGS	=	-shared -fPIC

$(NAME):	$(OBJ)
		$(CC) -nostdlib -shared -fPIC $(OBJ) -o $(NAME)
all:	$(NAME)

%.o:	%.asm
		$(ASM) -f elf64 -o $@ $<

clean:
		rm -rf $(OBJ)

fclean:	clean
		rm -rf $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
