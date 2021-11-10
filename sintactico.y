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
%token <texto> NOMARR
%token <texto> ID
%token DIBUJAR
%token LINEA
%token REDONDO
%token ASIGNAR
%token FIN

%token PARA
%token PARC
%token COMA


%type <numero> constante
%start s

%%

/***********************
 * Reglas Gramaticales *
 ***********************/

/*Inicio de la gramatica*/
s :			dibujar INST FIN	
			;

INST:   INST INST |
        LINEAR |
        CUADRADOR |
        REDONDOR |
        TRIANGULOR |
        COLORR |
        RELLENOR |
        ASIGNARR
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