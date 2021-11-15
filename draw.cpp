#include "draw.h"
#include "sintactico.tab.hh"

int trayect_draw::parse(const std::string& archivo)
{
  file = archivo;
  iniciarScanner();
  yy::trayect_parser parser(*this);
  parser.set_debug_level(false);
  float resultado = parser.parse();
  terminarScanner();
  return resultado;
}
  
