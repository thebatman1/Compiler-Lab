#!/bin/bash

if [ $# -lt 2 ]
then
	echo 'Usage: ./runprog.sh filename.l filename.y [executablename]'
	exit 1
fi
if [ ! -e $1 ]
then
	echo 'lex file does not exist'
	exit 2
fi
if [ ! -e $2 ]
then
	echo 'yacc file does not exist'
	exit 3
fi
yacc -d $2
if [ $? != 0 ]
then
	echo 'Check your yacc file'
	exit 4
fi
lex $1
if [ $? != 0 ]
then
	echo 'Check your lex file'
	exit 4
fi
if [ $# -eq 3 ]
then
	gcc lex.yy.c y.tab.c -lfl -o "$3.out"
	./"$3.out"
else
	gcc lex.yy.c y.tab.c -lfl
	./a.out
fi
if [ $? != 0 ]
then
	echo 'Compilation or runtime error'
	exit 4
fi
