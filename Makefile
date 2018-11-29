CC = gcc

all: y.tab.c lex.yy.c compiler 

y.tab.c: parser.y
	@yacc -d parser.y 

lex.yy.c: lexa.l 
	@flex lexa.l

compiler: 
	@gcc -o castle lex.yy.c y.tab.c node.c
	@make clean

clean:
	@rm -rf *~ lex.yy.o y.tab.o lex.yy.c y.output y.tab.c y.tab.h node.o