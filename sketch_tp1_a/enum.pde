

enum Color {
  
  GRIS(#C3C3C3), 
  VIOLETA(#6441A5),
  LILA(#9467C9),
  NARANJA(#FFD000),
  MAGENTA(#FF0080),
  FUCSIA(#E30052);
  
  color unColor;
  
  private Color(color unColor) {
    this.unColor = unColor;
  }
  
}
