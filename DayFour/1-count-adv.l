%{
	#include <stdio.h>
	#include <stdlib.h>
	int keyword_count = 0, identifier_count = 0, operator_count = 0, comment_count = 0;
%}
%%
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
do { keyword_count++;
	fprintf(yyout, "%s", yytext);
}
[a-zA-Z][a-zA-Z0-9_]* { identifier_count++;
	fprintf(yyout, "%s", yytext);
}
[*<>=/%+-] { operator_count++; 
	fprintf(yyout, "%s", yytext); 
}
\/\/.* { comment_count++; } 
\/\*(.*\n*)*\*\/ { comment_count++; }   
%%
int main(int argc, char ** argv) {
	if (argc < 3) {
		printf("Usage: ./a.out infile outfile\n");
		exit(1);
	}	
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");
	yylex();	
	printf("No of keywords: %d\n", keyword_count);
	printf("No of operators: %d\n", operator_count);
	printf("No of identifier: %d\n", identifier_count);
	printf("No of comments: %d\n", comment_count);
	return 0;
}
