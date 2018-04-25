%{
	#include <stdio.h>
	#include <stdlib.h>
	int count = 0;
%}
%%
\/\/.* { count++; } 
\/\*(.*\n*)*\*\/ { count++; }   
%%
int main(int argc, char ** argv) {
	if (argc < 3) {
		printf("Usage: ./a.out infile outfile\n");
		exit(1);
	}
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");
	yylex();
	printf("No of comments: %d\n", count);
	return 0;
}
