%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
%}
%token LETTER DIGIT UND NL
%%
identifier: LETTER alphanumeric NL { printf("Valid identifier!\n"); exit(0); }
alphanumeric: LETTER alphanumeric
			| DIGIT alphanumeric
			| UND alphanumeric
			| LETTER
			| DIGIT
			| UND
%%
int yyerror(char * msg) {
	printf("Invalid identifier!\n");
	exit(0);
}
int main() {
	printf("Enter an identifier: ");
	yyparse();
	return 0;
}
