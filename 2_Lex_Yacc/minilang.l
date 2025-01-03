%{
#include "y.tab.h"
%}

%%

[0-9]+                  { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return TIMES; }
"/"                     { return DIVIDE; }
"="                     { return ASSIGN; }
";"                     { return SEMICOLON; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
[ \t\n]+                { /* Skip whitespaces */ }
.                       { printf("Unrecognized token: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}

