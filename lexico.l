
%{
	#include <cerrno>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "driver.h"
    #include "sintactico.tab.hh"
    #undef yywrap
    #define yywrap() 1
    static yy::location loc;
    int lineno = 1; // initialize to 1

    
    //void ret_print(char *tipo_token);
    //void yyerror();
%}

%option noyywrap nounput batch debug noinput
%option outfile="lex.cpp"

%x ML_COMMENT

ID          [A-Z]([a-z]*[0-9]+)*
ENTERO      [0-9][0-9]*
DELIMITADOR [\t\r\f" "]

%%

{ENTERO}    {return yy::trayect_parser::make_ENTERO(strtol(yytext, NULL, 10),loc);}
{ID}        {return yy::trayect_parser::make_ID(yytext,loc);}

<ML_COMMENT>"\n"        { lineno += 1; }

"dibujar" {return yy::trayect_parser::make_DIBUJAR(loc);}
"linea" {return yy::trayect_parser::make_LINEA(loc);}
"redondo" {return yy::trayect_parser::make_REDONDO(loc);}
"asignar" {return yy::trayect_parser::make_ASIGNAR(loc);}
"cuadro" {return yy::trayect_parser::make_CUADRO(loc);}
"triangulo" {return yy::trayect_parser::make_TRIANGULO(loc);}
"color" {return yy::trayect_parser::make_COLOR(loc);}
"relleno" {return yy::trayect_parser::make_RELLENO(loc);}
"azul" {return yy::trayect_parser::make_AZUL(loc);}
"amarillo" {return yy::trayect_parser::make_AMARILLO(loc);}
"rojo" {return yy::trayect_parser::make_ROJO(loc);}
"verde" {return yy::trayect_parser::make_VERDE(loc);}
"blanco" {return yy::trayect_parser::make_BLANCO(loc);}
"si" {return yy::trayect_parser::make_SI(loc);}
"no" {return yy::trayect_parser::make_NO(loc);}
"fin" {return yy::trayect_parser::make_FIN(loc);}

"(" {return yy::trayect_parser::make_PARA(loc);}
")" {return yy::trayect_parser::make_PARC(loc);}
"," { return yy::trayect_parser::make_COMA(loc);}
"=" {return yy::trayect_parser::make_IGUAL(loc);}
"\n"            { lineno += 1; }

{DELIMITADOR}   {}
.               {printf("ERROR LEXICO %s en lineno %i\n",yytext,lineno+1);
		 exit(0);}
<<EOF>>		{return yy::trayect_parser::make_FIN(loc);}

%%


void trayect_driver::iniciarScanner()
{
  yy_flex_debug = false;
  yyin = stdin;
}
void trayect_driver::terminarScanner()
{
  fclose(yyin);
}

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