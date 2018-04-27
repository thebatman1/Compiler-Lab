%{
	#include <stdio.h>
	int lines = 0, words = 0, letters = 0, splchar = 0;
%}
%%
[a-zA-Z] { letters++; }
[a-zA-Z]+ { words++; letters += yyleng; }
[!@#$%^&*():";'<>,.?/] { splchar++; }
\n { lines++; }
. 
%%
int main(int argc, char ** argv) {
	if (argc < 2) {
		fprintf(stderr, "Usage: ./a.out inputfile");
		return 1;
	} 
	yyin = fopen(argv[1], "r");	
	yylex();
	printf("No of words: %d\n", words);
	printf("No of lines: %d\n", lines);
	printf("No of special characters: %d\n", splchar);
	printf("No of letters: %d\n", letters);
	return 0;
}
