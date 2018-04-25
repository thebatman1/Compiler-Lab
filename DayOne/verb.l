%{
	#include <stdio.h>
%}
%%
[\t ]+ 
is     |
am     |
are    |
was    |
be     |
bring  |
been   |
do     |
does   |
did    |
will   |
would  |
should |
can    |
could  |
has    |
have   |
had    |
go     |
were {printf("%s : is a verb\n", yytext);}
[a-zA-Z]+ {printf("%s : is not a verb, try again\n", yytext);}
.|\n
%%
void main(){
yylex();
}
