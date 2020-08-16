
class Direccion {
  
  float sentido;
  
  
  Direccion() {
   
   sentido = radians(random(180));
   
 }
 
 void actualizar() {
  
   sentido += radians(random(-30,30)); 
   
 }
  
  
}

 
