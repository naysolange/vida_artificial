// Utiliza la mediana en vez del promedio
import TUIO.*;

TuioProcessing tuioClient;
AutomataCelular automata;
TuioObject objetoQueIngresa;

void setup() {
  size( 1200, 700 );
  //se inicializa pasando las columnas y filas
  automata = new AutomataCelular(60, 40);
  // Setea el modo de color a HSB
  colorMode(HSB);
  tuioClient  = new TuioProcessing(this);
}

void draw() {
  automata.actualizar();
  automata.dibujar();
}

void keyPressed() {
  if ( key == ' ' ) {
    automata.iniciar();
  }
}
