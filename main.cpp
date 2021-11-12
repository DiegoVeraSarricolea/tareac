#include <stdio.h>
#include "driver.h"
#include <iostream>
#include <string.h>
using namespace std;
int main()
{
  cout<<"*************************************************************************"<<endl;
  cout<<"Escriba las instrucciones en consola"<<endl;
  cout<<"en la ventana negra se verán reflejadas sus instrucciones..."<<endl;
  cout<<"*************************************************************************"<<endl<<endl;
  trayect_driver driver;
  driver.parse("f");
  return 0;
}
