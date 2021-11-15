mkdir exe
flex lexico.l
bison -yd sintactico.y
g++.exe -Wall -g -DDEBUG sintactico.tab.c lex.yy.c miniwin.cpp -o programa.exe -lgdi32 -luser32 -lkernel32 -mwindows -lfl