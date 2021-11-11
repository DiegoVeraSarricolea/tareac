%option noyywrap
%{
	#include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #include "AnalizadorSintactico.h"

    int lineno = 1; // initialize to 1
    
    //void ret_print(char *tipo_token);
    //void yyerror();
%}

%x ML_COMMENT

ID          [A-Z]([a-z]*[0-9]+)*
ENTERO      [0-9][0-9]*

%%

{ID} {return (ID);}
{ENTERO} {yylval.numero=atoi(yytext); return(ENTERO);}

<ML_COMMENT>"\n"        { lineno += 1; }

"dibujar" {return (DIBUJAR);}
"linea" {return (LINEA);}
"redondo" {return (REDONDO);}
"asignar" {return (ASIGNAR);}
"cuadro" {return (CUADRO);}
"triangulo" {return (TRIANGULO);}
"color" {return (COLOR);}
"relleno" {return (RELLENO);}
"fin" {return (FIN);}
"azul" {return (AZUL);}
"amarillo" {return (AMARILLO);}
"rojo" {return (ROJO);}
"verde" {return (VERDE);}
"blanco" {return (BLANCO);}
"si" {return (SI);}
"no" {return (NO);}

"(" {return (PARA);}
")" {return (PARC);}
"," { return (COMA);}
"=" {return (IGUAL);}
[ \t] ; /* ignora espacios */
"\n"            { lineno += 1; }
[ \t\r\f]+          /*Borra espacio en blanco */

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