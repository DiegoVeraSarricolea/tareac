
%skeleton "lalr1.cc" /* -*- C++ -*- */
%require "3.0.2"
%defines
%define api.parser.class {trayect_parser}
%define api.token.constructor
%define api.namespace {yy}
%define api.value.type variant
%define parse.assert
%code requires

{

/********************** 
 * Declaraciones en C *
 **********************/
  


 //Importacion de librerias
  #include <stdio.h>
  #include <stdlib.h>
  #include <math.h>
  #include <utility> 
  #include <vector>
  #include "string.h"
  #include "miniwin.h"
  
  class trayect_driver;

  extern int yylex(void);
  extern char *yytext;
  extern FILE *yyin;

  //Declaracion de metodos 
  void yyerror(char *s);

}

%param { trayect_driver& driver }
%locations
%define parse.trace
%define parse.error verbose
%code
{
#include "driver.h"
#include <iostream>

int posx,posy;
std::vector<std::pair<std::string, float> > v;
std::vector<std::pair<std::string, std::string> > cl;
}
%define api.token.prefix {TOK}

/*************************
  Declaraciones de Bison *
 *************************/


/*Declaración de tokens*/
%token <float> ENTERO
%token <std::string> ID
%token DIBUJAR
%token LINEA
%token REDONDO
%token CUADRO
%token TRIANGULO
%token COLOR
%token RELLENO
%token ASIGNAR
%token AZUL
%token AMARILLO
%token ROJO
%token VERDE
%token BLANCO
%token SI
%token NO
%token FIN 0 "eof"

%token PARA
%token PARC
%token COMA
%token IGUAL


%type <float> constante
%type <std::string> var
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

void yy::trayect_parser::error(const location_type& lugar, const std::string& lexema)
{
  std::cout << "Error Sintactico " << lexema << std::endl;
  exit(0);
  
}