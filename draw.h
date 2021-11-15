#ifndef DRAW
# define DRAW
# include <string>
# include "sintactico.tab.hh"
#define YY_DECL \
yy::trayect_parser::symbol_type yylex (trayect_draw& draw)
YY_DECL;

class trayect_draw
{
public:
  float resultado;
  void iniciarScanner();
  void terminarScanner();
  
  int parse(const std::string& archivo);
  
  std::string file;
};
#endif
