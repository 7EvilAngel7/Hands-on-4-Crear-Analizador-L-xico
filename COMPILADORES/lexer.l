%{
#include <stdio.h>
extern FILE *yyin; 
%}

%option noyywrap

DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
INT_LIT     {DIGIT}+

%%
"int"       { printf("PALABRA RESERVADA: int\n"); }
"float"     { printf("PALABRA RESERVADA: float\n"); }
"double"    { printf("PALABRA RESERVADA: double\n"); }
"char"      { printf("PALABRA RESERVADA: char\n"); }
"void"      { printf("PALABRA RESERVADA: void\n"); }
"short"     { printf("PALABRA RESERVADA: short\n"); }
"return"    { printf("PALABRA RESERVADA: return\n"); }

"#include"  { printf("\nDIRECTIVA PREPROCESADOR: #include\n"); }
"#define"   { printf("\nDIRECTIVA PREPROCESADOR: #define\n"); }

"++"        { printf("OPERADOR: INCREMENTO\n"); }
"+"         { printf("OPERADOR: SUMA\n"); }
"*"         { printf("OPERADOR: MULTIPLICACION\n"); }
"/"         { printf("OPERADOR: DIVISION\n"); }
"-"         { printf("OPERADOR: RESTA\n"); }
"="         { printf("OPERADOR: ASIGNACION\n"); }

"("         { printf("DELIMITADOR: PARENTESIS ABRE\n"); }
")"         { printf("DELIMITADOR: PARENTESIS CIERRA\n"); }
"{"         { printf("DELIMITADOR: LLAVE ABRE\n"); }
"}"         { printf("DELIMITADOR: LLAVE CIERRA\n"); }
";"         { printf("DELIMITADOR: PUNTO Y COMA\n\n"); }
","         { printf("DELIMITADOR: COMA\n"); }
"<"         { printf("DELIMITADOR/OP RELACIONAL: MENOR QUE\n"); }
">"         { printf("DELIMITADOR/OP RELACIONAL: MAYOR QUE\n"); }

"//".* {}
"/*"([^*]|\*+[^*/])*\*+"/" {}

{INT_LIT}   { printf("LITERAL NUMERICO (INT): %s\n", yytext); }
{ID}        { printf("IDENTIFICADOR: %s\n", yytext); }

<<EOF>>     { return 0; } 

[ \t\n]+    

.           { printf("ERROR LEXICO: Caracter no reconocido -> %s\n", yytext); }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error: No se pudo abrir el archivo de entrada");
            return 1;
        }
        yyin = file; 
    } else {
        yyin = stdin; 
    }

    printf("--- INICIO DEL ANALISIS LEXICO ---\n");
    yylex(); 
    printf("--- FIN DEL ANALISIS LEXICO ---\n");

    if (argc > 1 && yyin != stdin) {
        fclose(yyin);
    }
    return 0;
}