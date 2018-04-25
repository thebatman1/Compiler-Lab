%{
	#include <stdio.h>
	int vowelcount = 0, consonantcount = 0;
%}
%%
[\t ]+
[a,e,i,o,u,A,E,I,O,U] { vowelcount++; }
[a-zA-Z] { consonantcount++; }
\n { printf("Vowels: %d\nConsonants: %d\n", vowelcount, consonantcount); 
		vowelcount = 0; consonantcount = 0;
}
.
%%
int main() {
	yylex();
	return 0;	
} 
