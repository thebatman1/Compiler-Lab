%{
	#include <stdio.h>
%}
%%
[\t ]+
printf |
scanf |
int |
float |
double |
char |
return |
main |
void |
if |
else |
for |
while |
do { printf("%s is a keyword\n", yytext); }
#define |
#include |
#line |
#error |
#endif |
#ifdef |
#ifndef { printf("%s is a preprocessor directive\n", yytext); }
[a-zA-Z][a-zA-Z0-9_]*\.h { printf("%s is a header file\n", yytext); }
[a-zA-Z][a-zA-Z0-9_]* { printf("%s is an identifier\n", yytext); }
[0-9]+ { printf("%s is a number\n", yytext); }
[*/%+-] { printf("%s is an operator\n", yytext); }
\n { printf("\\n is an escape sequence\n"); }
. { printf("%s is a symbol\n", yytext); }
%%
int main(void) {
	yylex();	
	return 0;
}
