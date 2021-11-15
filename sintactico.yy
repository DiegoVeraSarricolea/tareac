
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
  
  class trayect_draw;

  extern int yylex(void);
  extern char *yytext;
  extern FILE *yyin;

  //Declaracion de metodos 
  void yyerror(char *s);
  void dibujaLinea(float posx1,float posy1,float posx2,float posy2);
  void dibujaCuadro(float posx1,float posy1,float posx2,float posy2);
  void dibujaRedondo(float posx,float posy , float ratio);
  void dibujaTriangulo(float posx1,float posy1,float posx2,float posy2,float posx3,float posy3);
  void guardaColor(std::string colour);
  void guardaAzul();
  void guardaAmarillo();
  void guardaBlanco();
  void guardaRojo();
  void guardaVerde();
  void guardaRelleno(std::string relleno);
  void guardaBoolean(std::string boolean);
  void asignaAzul(std::string azul);
  void asignaAmarillo(std::string amarillo);
  void asignaBlanco(std::string blanco);
  void asignaRojo(std::string rojo);
  void asignaVerde(std::string verde);
  void asignaSi();
  void asignaNo();
  void asignaConstante();
}

%param { trayect_draw& draw }
%locations
%define parse.trace
%define parse.error verbose
%code
{
#include "draw.h"
#include <iostream>

std::string rellenar = "no";
std::vector<std::pair<std::string, float> > v;
std::vector<std::pair<std::string, std::string> > cl;
}
%define api.token.prefix {TOK}

/*************************
  Declaraciones de Bison *
 *************************/


/*Declaración de tokens*/

//Listado de terminales 
%token <float> NUMERO
%token <std::string> ID
%token DIBUJAR
%token LINEA
%token REDONDO
%token CUADRO
%token TRIANGULO
%token COLOR
%token RELLENO
//%token ASIGNAR
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

//Listado de no terminales 

%type <float> INST 
%type <float> E 
%type <float> LINEAR
%type <float> CUADROR
%type <float> REDONDOR
%type <float> TRIANGULOR
%type <float> COLORR 
%type <float> RELLENOR
%type <std::string> var
%type <float> constante
//%type <float> ASIGNARR

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
        RELLENOR //|
        //ASIGNARR
        ;


LINEAR: LINEA PARA E COMA E COMA E COMA E PARC {dibujaLinea($3,$5,$7,$9);}
        ;

CUADROR: CUADRO PARA E COMA E COMA E COMA E PARC {dibujaCuadro($3,$5,$7,$9);}
        ;

REDONDOR: REDONDO PARA E COMA E COMA E PARC {dibujaRedondo($3,$5,$7);}
        ;

TRIANGULOR: TRIANGULO PARA E COMA E COMA E COMA E COMA E COMA E PARC {dibujaTriangulo($3,$5,$7,$9,$11,$13);}
        ;

COLORR: COLOR PARA ID PARA {guardaColor($3);} |
        COLOR PARA AZUL PARC {guardaAzul();} |
        COLOR PARA AMARILLO PARC {guardaAmarillo();} |
        COLOR PARA ROJO PARC {guardaRojo();} |
        COLOR PARA VERDE PARC {guardaVerde();} |
        COLOR PARA BLANCO PARC {guardaBlanco();}
        ;

RELLENOR: RELLENO PARA ID PARC {guardaRelleno($3);} |
        RELLENO PARA SI PARC {guardaBoolean("si");} |
        RELLENO PARA NO PARC {guardaBoolean("no");}
        ;
/*
ASIGNARR: ASIGNAR ID IGUAL AZUL {asignaAzul("AZUL");} |
          ASIGNAR ID IGUAL AMARILLO {asignaAmarillo("AMARILLO");} |
          ASIGNAR ID IGUAL ROJO {asignaRojo("ROJO");} |
          ASIGNAR ID IGUAL VERDE {asignaVerde("VERDE");} |
          ASIGNAR ID IGUAL BLANCO {asignaBlanco("BLANCO");} |
          ASIGNAR ID IGUAL SI {asignaSi("SI");} |
          ASIGNAR ID IGUAL NO {asignaNo("NO");} |
          ASIGNAR ID IGUAL E {asignaConstante($1,$3);}
          ;
*/ 

E: var | constante;

var: ID { $$ = $1;} 
        ;

constante:  NUMERO { $$ = $1;}
        ;

FINALIZAR: FIN {exit (-1);}
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

/*************************
  *Funciones *
 *************************/

 void dibujaLinea(float posx1,float posy1,float posx2,float posy2){

         miniwin::linea(posx1,posy1,posx2,posy2);
         miniwin::refresca();
 }

 void dibujaCuadro(float posx1,float posy1,float posx2,float posy2){
         
         if (rellenar == "si"){
                 miniwin::rectangulo_lleno(posx1,posy1,posx2,posy2);
                 miniwin::refresca();
         }
        else if (rellenar == "no"){
                miniwin::rectangulo(posx1,posy1,posx2,posy2);
                miniwin::refresca();
        }
         
 }

  void dibujaRedondo(float posx,float posy,float ratio){
        
         if (rellenar == "si"){
                 miniwin::circulo_lleno( posx, posy, ratio);
                 miniwin::refresca();
         }
        else if (rellenar == "no"){
                miniwin::circulo( posx, posy, ratio);
                miniwin::refresca();
        }
 }

  void dibujaTriangulo(float posx1,float posy1,float posx2,float posy2,float posx3,float posy3){
         if (rellenar == "si"){
                 miniwin::linea(posx1,posy1,posx2,posy2);
                 miniwin::linea(posx2,posy2,posx3,posy3);
                 miniwin::linea(posx1,posy1,posx3,posy3);
                 miniwin::texto(posx1,posy1, "R");
                 miniwin::refresca();
         }
        else if (rellenar == "no"){
                miniwin::linea(posx1,posy1,posx2,posy2);
                miniwin::linea(posx2,posy2,posx3,posy3);
                miniwin::linea(posx1,posy1,posx3,posy3);
                miniwin::refresca();
        }
         
 }

void guardaColor(std::string colour ){
        if(colour == "AMARILLO"){
                miniwin::color(miniwin::AMARILLO);
                miniwin::refresca();
        }
        else if(colour == "ROJO"){
                miniwin::color(miniwin::ROJO);
                miniwin::refresca();   
        }
        else if(colour == "VERDE"){
                miniwin::color(miniwin::VERDE);
                miniwin::refresca();   
        }
        else if(colour == "BLANCO"){
                miniwin::color(miniwin::BLANCO);
                miniwin::refresca();   
        }

        else if(colour =="AZUL"){
                miniwin::color(miniwin::AZUL);
                miniwin::refresca();    
        }
        
}

void guardaRelleno(std::string relleno){

        if (relleno == "si"){
                 ::rellenar = "si"; 
                 miniwin::refresca(); 
        }
        else if (relleno == "no"){
                 ::rellenar ="no";
                 miniwin::refresca();
        }
}
void guardaBoolean(std::string boolean){
        ::rellenar = boolean;
}
  

void guardaRojo(){
	miniwin::color(miniwin::ROJO);
        miniwin::refresca();
}
void guardaVerde(){
	miniwin::color(miniwin::VERDE);
        miniwin::refresca();
}
void guardaAzul(){
	miniwin::color(miniwin::AZUL);
        miniwin::refresca();
}
void guardaAmarillo(){
	miniwin::color(miniwin::AMARILLO);
        miniwin::refresca();
}
void guardaBlanco(){
	miniwin::color(miniwin::BLANCO);
        miniwin::refresca();
}