%{
	#include "y.tab.h"
	int extern yyval;
%}
%%
[\t ]+ 
int | float | double | return | auto | extern | char | struct | break | else | long | switch | case | while | for 
[a-zA-Z] { return LETTER; }
[0-9] { return DIGIT; }
_ { return UND; }
\n { return NL; }
. { return yytext[0]; }
%%
