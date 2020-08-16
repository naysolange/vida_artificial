

class Companiere {
  
 Direccion direccion; 
 float velocidad;
 float x, y;
 float r;
 Color relleno;  
 boolean seTransformo;
 boolean perteneceAUnGrupo;
 
 Companiere() {
  
   direccion = new Direccion();
   velocidad = random(2,5);
   x = random(width);
   y = random(height);
   r = random(3, 10);
   relleno = Color.GRIS;
   
 }
 
 Companiere(float x, float y, boolean seTransformo) {
   direccion = new Direccion();
   velocidad = random(2,5);
   this.x = x;
   this.y = y;
   r = random(3, 10);
   relleno = colorAlAzar();
   this.seTransformo = seTransformo;
   this.perteneceAUnGrupo = !seTransformo;
   
 }
 
 void dibujarse() {
  
   pushStyle();
   noStroke();
   fill(relleno.unColor);
   ellipse(x, y, r, r);
   popStyle();
      
 }
 
 void moverse() {
   
  if(!perteneceAUnGrupo) { 
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
 
 void transformarse(Companiere companiere) {
   
   if(!seTransformo) {
     relleno = colorAlAzar();
     direccion = companiere.direccion;
     seTransformo = true;
     perteneceAUnGrupo = true;
   }
   
 }
 
 private Color colorAlAzar() {
   int dado = int(random(colores.keySet().size()));
   return (Color)colores.get(dado);
 }
 
 
  
  
}
