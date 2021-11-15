#include <stdio.h>
#include "draw.h"
#include <iostream>
#include <string.h>
using namespace std;
int main()
{
  cout<<"*************************************************************************"<<endl;
  cout<<"Escriba las instrucciones en consola"<<endl;
  cout<<"Figuras disponibles: linea, cuadro, redondo, triangulo..."<<endl;
  cout<<"Colores disponibles: verde, blanco, azul, rojo, amarillo..."<<endl;
  cout<<"relleno(si) y relleno(no)..."<<endl;
  cout<<"en la ventana negra se verán reflejadas sus instrucciones..."<<endl;
  cout<<"*************************************************************************"<<endl<<endl;
  trayect_draw draw;
  draw.parse("f");
  return 0;
}
