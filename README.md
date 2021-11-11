# tareac

## Compilación y ejecución

Utilizar los siguientes comandos:

~~~
flex lexico.l
bison -d -o AnalizadorSintactico.c sintactico.y
gcc lex.yy.c sintactico.tab.c -o  analizador -lm
./analizador
~~~