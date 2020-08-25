float RADIO_AGENTE = 100.0;

class Companiere {
  
 Direccion direccion; 
 float velocidad;
 float x, y;
 float r;
 Color relleno;  
 boolean seTransformo;
 boolean guardaDireccionOriginal = true;
 
 Companiere() {
  
   direccion = new Direccion();
   velocidad = random(2,5);
   x = random(width);
   y = random(height);
   r = random(3, 10);
   relleno = Color.GRIS;
   
 }
 
 void dibujarse() {
  
   pushStyle();
   noStroke();
   fill(relleno.unColor);
   ellipse(x, y, r, r);
   popStyle();
      
 }
 
 void moverse() {
   
  if(guardaDireccionOriginal) { 
    direccion.actualizar(); 
  }
   
  x += cos(direccion.sentido) * velocidad;
  y += sin(direccion.sentido) * velocidad;
   
  x = x>width ? x-width : x;
  x = x<0 ? x+width : x;
  y = y>height ? y-height : y;
  y = y<0 ? y+height : y;
  
 }
  
 boolean seAcercaA(Companiere otroCompaniere) {
  float distancia = dist(x, y, otroCompaniere.x, otroCompaniere.y); 
  return distancia <= r + otroCompaniere.r;
 }
 
 boolean seAcercaA(TuioObject agenteDeCambio) {
  float distancia = dist(x, y, agenteDeCambio.getX() * width, agenteDeCambio.getY() * height); 
  return distancia <= r + RADIO_AGENTE; // Acá puse un radio asumiendo que el objeto tiene unos 2 cm aprox. Habria que ver el tamaño real del objeto.
 }
 
 // Un companiere puede transformarse a partir de la interacción con otra persona
 void verEnColores(Companiere companiere) {
   if(!seTransformo) {
     relleno = colorAlAzar();
     direccion = companiere.direccion;
     seTransformo = true;
     guardaDireccionOriginal = false;
   }
 }
 
 // Un companiere puede ver en colores a partir de la interacción con un agente de cambio feminista (libro, taller, experiencia, etc)
 void verEnColores() {
   relleno = colorAlAzar();
   seTransformo = true;
 }
 
 // Un companiere puede ver en celeste a partir de la interacción con un agente de cambio antiderechos (libro, taller, etc)
 void verEnCeleste() {
   if(!seTransformo) {
     relleno = Color.CELESTE;
   }
 }
 
 boolean veEnCeleste() {
   return relleno == Color.CELESTE;
 }
 
 boolean quiereVerEnColores() {
   return int(random(2)) == 1;
 }
 
  boolean quiereVerEnCeleste() {
   return int(random(3)) == 1;
 }
 
 private Color colorAlAzar() {
   int dado = int(random(colores.size()));
   return (Color)colores.get(dado);
 }
 

  
  
}
