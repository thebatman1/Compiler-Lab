/*** Definition Section ***/
%{
	#include <stdio.h>
%}
%% 
[.]* {
	printf("%s\n", yytext);
}
%%
int main(void){
	yylex();
	return 0;
}
