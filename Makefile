all:
	flex lexico.l
	bison -d sintactico.yy
	g++ -Wall -g -DDEBUG main.cpp draw.cpp sintactico.tab.cc lex.cpp miniwin.cpp -o prog -pthread -lX11 -lfl -std=c++11
