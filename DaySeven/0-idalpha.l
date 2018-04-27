%{
	#include <stdio.h>
%}
%%
[a-zA-Z] { printf("%s is an alphabet!\n", yytext); }
. { printf("%s is not an alphabet!\n", yytext); }
%%
int main() {
	printf("Enter a character: ");
	yylex();
	return 0;
}

