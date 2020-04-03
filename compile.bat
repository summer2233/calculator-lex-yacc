
bison -d -o y.tab.c parser.y
flex tokens.l
gcc -o simcalc y.tab.c lex.yy.c
pause
