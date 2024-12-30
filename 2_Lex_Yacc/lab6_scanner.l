%{
#include "y.tab.h"  // YACC-generated header file with token definitions
%}

%%

[0-9]+                  { return LAB6_NUMBER; }                /* Matches numeric values */
[a-zA-Z_][a-zA-Z0-9_]*  { return LAB6_IDENTIFIER; }            /* Matches identifiers */
"+"                     { return LAB6_PLUS; }                 /* Matches '+' */
"-"                     { return LAB6_MINUS; }                /* Matches '-' */
"*"                     { return LAB6_TIMES; }                /* Matches '*' */
"/"                     { return LAB6_DIVIDE; }               /* Matches '/' */
"="                     { return LAB6_ASSIGN; }               /* Matches '=' */
";"                     { return LAB6_SEMICOLON; }            /* Matches ';' */
"("                     { return LAB6_LPAREN; }               /* Matches '(' */
")"                     { return LAB6_RPAREN; }               /* Matches ')' */
[ \t\n]+                { /* Skip whitespaces and newlines */ }
.                       { printf("Unrecognized token: %s\\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
