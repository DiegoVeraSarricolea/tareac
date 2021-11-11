%{

/********************** 
 * Declaraciones en C *
 **********************/

 //Importacion de librerias
  #include <stdio.h>
  #include <stdlib.h>
  #include <math.h>
  #include "string.h"
  

  extern int yylex(void);
  extern char *yytext;
  extern FILE *yyin;

  //Declaracion de metodos 
  void yyerror(char *s);

%}

/*************************
  Declaraciones de Bison *
 *************************/
%union
{
  int numero;
  char* texto;
}

/*Declaración de tokens*/
%token <numero> ENTERO
%token <texto> ID
%token DIBUJAR
%token LINEA
%token REDONDO
%token CUADRO
%token TRIANGULO
%token COLOR
%token RELLENO
%token ASIGNAR
%token FIN
%token AZUL
%token AMARILLO
%token ROJO
%token VERDE
%token BLANCO
%token SI
%token NO

%token PARA
%token PARC
%token COMA
%token IGUAL


%type <numero> constante
%type <texto> var
%start s

%%

/***********************
 * Reglas Gramaticales *
 ***********************/

/*Inicio de la gramatica*/
s :			DIBUJAR INST FINALIZAR	
			;

INST:   INST INST |
        LINEAR |
        CUADROR |
        REDONDOR |
        TRIANGULOR |
        COLORR |
        RELLENOR |
        ASIGNARR
        ;


LINEAR: LINEA PARA E COMA E COMA E COMA E PARC
        ;

CUADROR: CUADRO PARA E COMA E COMA E COMA E PARC
        ;

REDONDOR: REDONDO PARA E COMA E COMA E PARC
        ;

TRIANGULOR: TRIANGULO PARA E COMA E COMA E COMA E COMA E COMA E PARC
        ;

COLORR: COLOR PARA var PARA |
        COLOR PARA AZUL PARC |
        COLOR PARA AMARILLO PARC |
        COLOR PARA ROJO PARC |
        COLOR PARA VERDE PARC |
        COLOR PARA BLANCO PARC
        ;

RELLENOR: RELLENO PARA var PARC |
        RELLENO PARA SI PARC |
        RELLENO PARA NO PARC
        ;

ASIGNARR: ASIGNAR var IGUAL AZUL |
        ASIGNAR var IGUAL AMARILLO |
        ASIGNAR var IGUAL ROJO |
        ASIGNAR var IGUAL VERDE |
        ASIGNAR var IGUAL BLANCO |
        ASIGNAR var IGUAL SI |
        ASIGNAR var IGUAL NO |
        ASIGNAR var IGUAL constante
        ;

E: var | constante
        ;

FINALIZAR: FIN {exit (-1);}
        ;

var: ID { $$ = $1;}
        ;

constante: ENTERO { $$ = $1;}
        ;

%%

/**********************
 * Codigo C Adicional *
 **********************/
void yyerror(char *s)
{
	printf("Error sintactico %s \n",s);
}

int main(int argc,char **argv) //Programa Principal
{
	yyparse(); //funcion propio de bison que ejecuta el analizador sintactico

	return 0;
}