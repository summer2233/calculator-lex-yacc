%{
    #include   <stdio.h>   
    #include   <stdlib.h>   
    #include   <math.h>   
    /* created by YACC */
    #include  "y.tab.h"   

    #include <math.h>
    extern double regList[26];
%}
number          [0-9]+[.]?[0-9]*
%%
[  \t]          { /*skip blanks*/ }

{number}        {   
                    // sscanf(yytext,"%lf",&yylval);
                    yylval.dVal = atof(yytext);
                    return NUMBER;    
                }
[a-z]           {
                    yylval.regNo = yytext[0] - 'a';
                    return NAME;                    
                }
  

\n|.      { return    yytext[0];   }

%%
int   yywrap()  { return   1;   }
