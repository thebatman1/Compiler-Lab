%{
	#include "y.tab.h"
%}
%%
[\t ]+
[aA] { return A; }
[bB] { return B; }
\n   { return NL; }
.    { return yytext[0]; }
%%
