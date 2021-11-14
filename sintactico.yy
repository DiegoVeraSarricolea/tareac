
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
  void dibujaLinea();
  void dibujaCuadro();
  void dibujaRedondo();
  void dibujaTriangulo();
  void guardaColor();
  void guardaAzul();
  void guardaAmarillo();
  void guardaBlanco();
  void guardaRojo();
  void guardaVerde();
  void guardaRelleno();
  void guardaSi();
  void guardaNo();
  void asignaAzul();
  void asignaAmarillo();
  void asignaBlanco();
  void asignaRojo();
  void asignaVerde();
  void asignaConstante();

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


LINEAR: LINEA PARA E COMA E COMA E COMA E PARC {dibujaLinea();}
        ;

CUADROR: CUADRO PARA E COMA E COMA E COMA E PARC {dibujaCuadro();}
        ;

REDONDOR: REDONDO PARA E COMA E COMA E PARC {dibujaRedondo();}
        ;

TRIANGULOR: TRIANGULO PARA E COMA E COMA E COMA E COMA E COMA E PARC {dibujaTriangulo();}
        ;

COLORR: COLOR PARA var PARA {guardaColor();} |
        COLOR PARA AZUL PARC {guardaAzul();} |
        COLOR PARA AMARILLO PARC {guardaAmarillo();} |
        COLOR PARA ROJO PARC {guardaRojo();} |
        COLOR PARA VERDE PARC {guardaVerde();} |
        COLOR PARA BLANCO PARC {guardaBlanco();}
        ;

RELLENOR: RELLENO PARA var PARC {guardaRelleno();} |
        RELLENO PARA SI PARC {guardaSi();} |
        RELLENO PARA NO PARC {guardaNo();}
        ;

ASIGNARR: ASIGNAR var IGUAL AZUL {asignaAzul();} |
        ASIGNAR var IGUAL AMARILLO {asignaAmarillo();} |
        ASIGNAR var IGUAL ROJO {asignaRojo();} |
        ASIGNAR var IGUAL VERDE {asignaVerde();} |
        ASIGNAR var IGUAL BLANCO {asignaBlanco();} |
        ASIGNAR var IGUAL SI {asignaSi();} |
        ASIGNAR var IGUAL NO {asignaNo();} |
        ASIGNAR var IGUAL constante {asignaConstante();}
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