all:
	flex lexico.l
	bison -d sintactico.yy
	g++ -Wall -g -DDEBUG main.cpp driver.cpp sintactico.tab.cc lex.cpp miniwin.cpp -o prog -pthread -lX11 -lfl -std=c++11
