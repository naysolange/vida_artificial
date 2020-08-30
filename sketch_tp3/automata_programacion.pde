import java.util.*;


float iniciarCelula() {  
  //carga en cada célula un valor al azar entre 0 y 255
  float valor = random(255);
  return valor;
}
//-------------------------------------------------------------------------------------------------------------------------
// PROGRAMAR AQUI: esta funciona es ejecutada por cada célula en cada ciclo para actualizar 
// su valor.
//-------------------------------------------------------------------------------------------------------------------------

float actualizarCelula( float actual, float n, float ne, float e, float se, float s, 
  float so, float o, float no, float x, float y ) {

  float proximo = mediana(actual, n, ne, e, se, s, so, o, no); 
   
  if(objetoQueIngresa != null && dist(x, y, objetoQueIngresa.getX()*width, objetoQueIngresa.getY()*height) < 100){
    proximo = actual+30;
  }

  return proximo;
}

private float mediana(float actual, float n, float ne, float e, float se, float s, 
  float so, float o, float no) {
  float[] celulas = {actual,n,ne,e,se,s,so,o,no};
  Arrays.sort(celulas);
  return celulas[4];
}

//-------------------------------------------------------------------------------------------------------------------------
// PROGRAMAR AQUI: esta funciona es ejecutada por cada célula en cada ciclo para dibujarse 
// en pantalla.
//-------------------------------------------------------------------------------------------------------------------------

void dibujarCelula( float actual, float x, float y, float ancho, float alto ) {

  rectMode(CENTER);
  float tinte = 0;
  float valor = actual % 501;
   
  if( valor <= 250 ){
    tinte = map( valor , 0 , 250 , 80 , 165);
  } else {
    tinte = map( valor , 250 , 500 , 166 , 210);
  }
  
  strokeWeight(2);
  stroke(0, 0, 360);
  fill(tinte, 200, 360);

  rect(x, y, ancho, alto);

}
//---------------------------


void addTuioObject(TuioObject tobj) {
  objetoQueIngresa = tobj;
}

void removeTuioObject(TuioObject tobj) {
  objetoQueIngresa = null;
}
