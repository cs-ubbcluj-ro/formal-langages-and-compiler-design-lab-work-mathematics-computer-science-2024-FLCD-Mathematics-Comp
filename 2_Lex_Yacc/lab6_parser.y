%{
#include <stdio.h>
#include <stdlib.h>

/* function  */
void yyerror(const char *);
int yylex(void);
%}

/* tokens */
%token LAB6_NUMBER LAB6_IDENTIFIER LAB6_PLUS LAB6_MINUS LAB6_TIMES LAB6_DIVIDE LAB6_ASSIGN LAB6_SEMICOLON LAB6_LPAREN LAB6_RPAREN

%%

/* grammar rules */
lab6_program
    : lab6_statement_list { printf("lab 6: program syntactic correct\n"); }
    ;

lab6_statement_list
    : lab6_statement LAB6_SEMICOLON { printf("1: statement_list -> statement SEMICOLON\n"); }
    | lab6_statement_list lab6_statement LAB6_SEMICOLON { printf("2: statement_list -> statement_list statement SEMICOLON\n"); }
    ;

lab6_statement
    : LAB6_IDENTIFIER LAB6_ASSIGN lab6_expression { printf("3: statement -> IDENTIFIER ASSIGN expression\n"); }
    ;

lab6_expression
    : lab6_term { printf("4: expression -> term\n"); }
    | lab6_expression LAB6_PLUS lab6_term { printf("5: expression -> expression PLUS term\n"); }
    | lab6_expression LAB6_MINUS lab6_term { printf("6: expression -> expression MINUS term\n"); }
    ;

lab6_term
    : lab6_factor { printf("7: term -> factor\n"); }
    | lab6_term LAB6_TIMES lab6_factor { printf("8: term -> term TIMES factor\n"); }
    | lab6_term LAB6_DIVIDE lab6_factor { printf("9: term -> term DIVIDE factor\n"); }
    ;

lab6_factor
    : LAB6_NUMBER { printf("10: factor -> NUMBER\n"); }
    | LAB6_IDENTIFIER { printf("11: factor -> IDENTIFIER\n"); }
    | LAB6_LPAREN lab6_expression LAB6_RPAREN { printf("12: factor -> LPAREN expression RPAREN\n"); }
    ;

%%

/* error handling */
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
