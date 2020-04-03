%{
#include <ctype.h>
#include <stdio.h>
/* type for Yacc semantic stack */
extern void yyerror(char*);
extern int yylex(); // in Lexer
double regList[26];
%}
%union {
    int dVal;
    int regNo;
}
%token <regNo> NAME
%token <dVal> NUMBER
%left       '+'    '-'
%left       '*'   '/'
%nonassoc   UMINUS
%type <dVal> E
%%
S   :     /* ε  : empty rule */
    | S SE '\n'  
    | S '\n'
    ;
SE  : NAME '=' E    {regList[$1] = $3; }
    | E         {printf("= %d\n", $1); }
E   : 
    | E '|' E   { $$ = $1 | $3; }
    | E '&' E   { $$ = $1 & $3; }
    | E '+' E   { $$ = $1 + $3; }
    | E '-' E   { $$ = $1 - $3; }
    | E '*' E   { $$ = $1 * $3; }
    | E '/' E   { $$ = $1 / $3; }
    | E '%' E   { $$ = $1 % $3; }
    | '-' E %prec UMINUS {$$ = -$2; }
    | '+' E %prec UMINUS {$$ = $2; }
    | '(' E ')' { $$ = $2;  }
    | NUMBER    { $$ = $1;  }
    | NAME      {$$ = regList[$1]; }
    ;
%%

int main(){
    yyparse();
    return 0;
}

void yyerror(char *s){
    fprintf(stderr,"%s\n",s);
}
