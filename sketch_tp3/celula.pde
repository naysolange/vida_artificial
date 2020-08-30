// Actualizada al 21/Ago/2020
//-------------------------------------------------------------------------------------------------------------------------
//
//  Emiliano Causa 2008-2020
//  emiliano.causa@gmail.com
//  emilianocausa.ar
//  biopus.ar
//
//-------------------------------------------------------------------------------------------------------------------------
class Celula {

  float actual;
  float futuro;

  float x, y, ancho, alto;

  int vecinoX[], vecinoY[];

  //---------------------------

  Celula( int i, int j, int col, int fil ) {
    vecinoX = new int[8];
    vecinoY = new int[8];

    //n
    vecinoX[0] = i;
    vecinoY[0] = j-1;
    //ne
    vecinoX[1] = i+1;
    vecinoY[1] = j-1;
    //e
    vecinoX[2] = i+1;
    vecinoY[2] = j;
    //se
    vecinoX[3] = i+1;
    vecinoY[3] = j+1;
    //s
    vecinoX[4] = i;
    vecinoY[4] = j+1;
    //so
    vecinoX[5] = i-1;
    vecinoY[5] = j+1;
    //o
    vecinoX[6] = i-1;
    vecinoY[6] = j;
    //no
    vecinoX[7] = i-1;
    vecinoY[7] = j-1;

    for ( int k=0; k<8; k++ ) {
      vecinoX[k] = ( vecinoX[k] < 0 ? col-1 : vecinoX[k] );
      vecinoX[k] = ( vecinoX[k] > col-1 ? 0 : vecinoX[k] );
      vecinoY[k] = ( vecinoY[k] < 0 ? fil-1 : vecinoY[k] );
      vecinoY[k] = ( vecinoY[k] > fil-1 ? 0 : vecinoY[k] );
    }

  }
  //---------------------------

  void actualizar() {
    actual = futuro;
  }
  //---------------------------

  void dibujar() {
    dibujarCelula( actual, x, y, ancho, alto );
  }
  //---------------------------
  
  void iniciar(){
    actual = iniciarCelula();
  }
  //---------------------------

  void localizar(float x, float y, float ancho, float alto) {
    this.x = x + ancho/2;
    this.y = y + alto/2;
    this.ancho = ancho;
    this.alto = alto;
  }
  //---------------------------

  void operar( AutomataCelular todos ) {

    futuro = actualizarCelula( actual 
      , todos.celulas[ vecinoX[0] ][ vecinoY[0] ].actual 
      , todos.celulas[ vecinoX[1] ][ vecinoY[1] ].actual 
      , todos.celulas[ vecinoX[2] ][ vecinoY[2] ].actual
      , todos.celulas[ vecinoX[3] ][ vecinoY[3] ].actual 
      , todos.celulas[ vecinoX[4] ][ vecinoY[4] ].actual
      , todos.celulas[ vecinoX[5] ][ vecinoY[5] ].actual
      , todos.celulas[ vecinoX[6] ][ vecinoY[6] ].actual
      , todos.celulas[ vecinoX[7] ][ vecinoY[7] ].actual
      , x
      , y
      );
  }
  //---------------------------
}
