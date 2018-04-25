%{
	#include "y.tab.h"
	int extern yylval;
%}
%%
[\t ]+
[0-9]+ { yylval = atoi(yytext); return NUM; }
\+ { return '+'; }
\- { return '-'; }
\* { return '*'; }
\/ { return '/'; }
\n { return 0; }
. { return yytext[0]; }
%%
