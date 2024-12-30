%{
#include <stdio.h>
#include <stdlib.h>

/* function */
void yyerror(const char *);
int yylex(void);
%}

/* tokens */
%token NUMBER IDENTIFIER PLUS MINUS TIMES DIVIDE ASSIGN SEMICOLON LPAREN RPAREN

%%

/* grammar rules */
program
    : statement_list { printf("Program syntactic correct\n"); }
    ;

statement_list
    : statement SEMICOLON { printf("1: statement_list -> statement SEMICOLON\n"); }
    | statement_list statement SEMICOLON { printf("2: statement_list -> statement_list statement SEMICOLON\n"); }
    ;

statement
    : IDENTIFIER ASSIGN expression { printf("3: statement -> IDENTIFIER ASSIGN expression\n"); }
    ;

expression
    : term { printf("4: expression -> term\n"); }
    | expression PLUS term { printf("5: expression -> expression PLUS term\n"); }
    | expression MINUS term { printf("6: expression -> expression MINUS term\n"); }
    ;

term
    : factor { printf("7: term -> factor\n"); }
    | term TIMES factor { printf("8: term -> term TIMES factor\n"); }
    | term DIVIDE factor { printf("9: term -> term DIVIDE factor\n"); }
    ;

factor
    : NUMBER { printf("10: factor -> NUMBER\n"); }
    | IDENTIFIER { printf("11: factor -> IDENTIFIER\n"); }
    | LPAREN expression RPAREN { printf("12: factor -> LPAREN expression RPAREN\n"); }
    ;

%%

/* error */
void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    exit(EXIT_FAILURE);
}

/* main */
int main(void) {
    if (yyparse() == 0) {
        printf("parsing completed\n");
    } else {
        printf("parsing failed\n");
    }
    return 0;
}

