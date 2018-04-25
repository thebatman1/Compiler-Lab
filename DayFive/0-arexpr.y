%{
	#include <stdio.h>
	int yylex();
%}
%token NUM
%right '*''/'
%left '-''+'
%%
start : e { printf("%d\n", $$); }
e : e '+' e { $$ = $1 + $3; }
  | e '-' e { $$ = $1 - $3; }
  |	e '*' e { $$ = $1 * $3; }
  |	e '/' e { $$ = $1 / $3; }
  |	'(' e ')'  { $$ = $2; }
  |	NUM { $$ = $1; }
%%
int yywrap() {}
int yyerror(char * msg) {
	printf("Error\n");
}
int main() {
	printf("Enter the expression: ");
	if (yyparse() == 0) {
		printf("Success\n");
	}
	return 0;
}
