

enum Color {
  
  GRIS(#C3C3C3), 
  VIOLETA(#6441A5),
  LILA(#9467C9),
  VERDE_OSCURO(#317F43),
  MAGENTA(#FF0080),
  FUCSIA(#E30052),
  VERDE(#98FB98),
  CELESTE(#51D1F6);
  
  color unColor;
  
  private Color(color unColor) {
    this.unColor = unColor;
  }
  
}
