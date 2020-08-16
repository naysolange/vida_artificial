/*
Hacer click para introducir un compañere que tenga "lentes violetas"
*/

import java.util.Map;

ArrayList<Companiere> companieres = new ArrayList<Companiere>();
Map<Integer, Color> colores = new HashMap<Integer, Color>();

void setup() {
  
 size(1200, 800);
 background(0);
 
 colores.put(0, Color.VIOLETA);
 colores.put(1, Color.NARANJA);
 colores.put(2, Color.MAGENTA);
 colores.put(3, Color.FUCSIA);
 colores.put(4, Color.LILA);
  
 for(int i=0; i<15; i++) {
   companieres.add(new Companiere());
 }
 
}


void draw() {
  
  fill(0, 15);
  rect(0, 0, width, height);
  
  for(Companiere companiere : companieres) {
    companiere.dibujarse();
    companiere.moverse();
  }
  
  for(int i=0; i<companieres.size(); i++) {
   
    Companiere unCompaniere = companieres.get(i);
    
    for(int j=i+1; j<companieres.size(); j++) {
     
      Companiere otroCompaniere = companieres.get(j);
      
      if(unCompaniere.seAcercaA(otroCompaniere)) {
        
        if(unCompaniere.seTransformo) {
          otroCompaniere.transformarse(unCompaniere);
          
        } else if(otroCompaniere.seTransformo) {
          unCompaniere.transformarse(otroCompaniere);
        }
      }
    }
  }
  
  if(frameCount % 80 == 0) {
    companieres.add(new Companiere());
  }
}

void mousePressed() {
  agregarCompaniereTransformade();
}

void agregarCompaniereTransformade() {
  companieres.add(new Companiere(mouseX, mouseY, true));
}
