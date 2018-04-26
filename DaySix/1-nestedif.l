%{
	#include "y.tab.h"
	int extern yylval;
%}
%%
[\t ]+ 
"if" { return IF; }
[sS][0-9]* { return S; }
"<"|">"|"<="|">="|"=="|"!=" { return RELOP; }
[a-zA-Z][a-zA-Z0-9_]* { return ID; }
[0-9]+ { return NUMBER; }
\n { return NL; }
. { return yytext[0]; }
%%
