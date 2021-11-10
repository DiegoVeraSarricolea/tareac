%option noyywrap
%{
	#include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #include "sintactico.tab.h"

    int lineno = 1; // initialize to 1
    
    //void ret_print(char *tipo_token);
    //void yyerror();
%}

%x ML_COMMENT

ID          [A-Z]([a-z]*[0-9]+)*
ENTERO      [0-9]+

%%

<ML_COMMENT>"\n"        { lineno += 1; }

"dibujar"$	        		printf("%s es una palabra reservada\n", yytext);
"linea"$				printf("%s es una palabra reservada\n", yytext);
"redondo"$				printf("%s es una palabra reservada\n", yytext);
"asignar"$				printf("%s es una palabra reservada\n", yytext);
"fin"$				printf("%s es una palabra reservada\n", yytext);

([A-Z]([a-z]*[0-9]+)*)$		printf("%s es un identificador\n", yytext);

([0-9][0-9]*)$			printf("%s es una constante entera\n", yytext);

"("$					printf("%s es un simbolo\n", yytext);
")"$					printf("%s es un simbolo\n", yytext);
","$					printf("%s es un simbolo\n", yytext);
"="$					printf("%s es un simbolo\n", yytext);
[ \t] ; /* ignora espacios */
"\n"            { lineno += 1; }
[ \t\r\f]+          /*Borra espacio en blanco */

.					printf(" ");
%%




/*
void ret_print(char *tipo_token){
    printf("yytext: %s\ttoken: %s\tlineno: %d\n", yytext, tipo_token, lineno);
}
 
void yyerror(char *mensaje){
    printf("Error: \"%s\" en linea %d. Token = %s\n", mensaje, lineno, yytext);
    exit(1);
}
 
int main(int argc, char *argv[]){
    printf("Ingrese Tokens(Palabras reservadas, enteros, simbolos, identificadores): ");
    yylex();
    return 0;
}

*/