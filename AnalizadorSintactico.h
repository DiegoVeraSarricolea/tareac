/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ENTERO = 258,
     ID = 259,
     DIBUJAR = 260,
     LINEA = 261,
     REDONDO = 262,
     CUADRO = 263,
     TRIANGULO = 264,
     COLOR = 265,
     RELLENO = 266,
     ASIGNAR = 267,
     FIN = 268,
     AZUL = 269,
     AMARILLO = 270,
     ROJO = 271,
     VERDE = 272,
     BLANCO = 273,
     SI = 274,
     NO = 275,
     PARA = 276,
     PARC = 277,
     COMA = 278,
     IGUAL = 279
   };
#endif
/* Tokens.  */
#define ENTERO 258
#define ID 259
#define DIBUJAR 260
#define LINEA 261
#define REDONDO 262
#define CUADRO 263
#define TRIANGULO 264
#define COLOR 265
#define RELLENO 266
#define ASIGNAR 267
#define FIN 268
#define AZUL 269
#define AMARILLO 270
#define ROJO 271
#define VERDE 272
#define BLANCO 273
#define SI 274
#define NO 275
#define PARA 276
#define PARC 277
#define COMA 278
#define IGUAL 279




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 27 "sintactico.y"
{
  int numero;
  char* texto;
}
/* Line 1529 of yacc.c.  */
#line 102 "AnalizadorSintactico.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

