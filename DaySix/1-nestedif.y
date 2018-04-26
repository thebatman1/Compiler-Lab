%{
	#include <stdio.h>
	#include <stdlib.h>
	int count = 0;
	int yylex();
%}
%token IF S NL ID NUMBER RELOP
%%
Statement : IF_Stmt NL { printf("The no of nested ifs are: %d\n", count); exit(0);} 
IF_Stmt : IF'('expr')''{'IF_Stmt'}' { count++; }
		| S
expr : x RELOP x
x : ID | NUMBER 
%%
int yyerror( char * msg ) {
	printf("Invalid statement");
	exit(0);
}
int main() {
	printf("Enter the statement: ");
	yyparse();
	return 0;
}
