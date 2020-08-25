import TUIO.*;

/*
Insertar agente de cambio diversidad (fiduciario id par) 
Insertar agente de cambio antiderecho (fiduciario id impar)
*/

import java.util.Map;
import java.util.List;
import java.util.*; 
import TUIO.*;

List<Color> colores = Arrays.asList(Color.VIOLETA, Color.VERDE, Color.MAGENTA, Color.FUCSIA, Color.LILA, Color.VERDE_OSCURO);
ArrayList<Companiere> companieres = new ArrayList<Companiere>();
TuioProcessing clienteTUIO;

void setup() {
  
 size(1200, 800);
 background(0);

 for(int i=0; i<10; i++) {
   companieres.add(new Companiere());
 }
 
  clienteTUIO  = new TuioProcessing(this);
 
}


void draw() {
  
  fill(0, 8);
  rect(0, 0, width, height);
  
  for(Companiere companiere : companieres) {
    companiere.dibujarse();
    companiere.moverse();
  }
  
  List<TuioObject> agentesDeCambio = clienteTUIO.getTuioObjectList(); 
  
  
  for(TuioObject agenteDeCambio : agentesDeCambio) {
   
    for(Companiere companiere: companieres) {
      
      if(!companiere.seTransformo && companiere.seAcercaA(agenteDeCambio)) {
        
        if(agenteDeCambio.getSymbolID() % 2 == 0) {
           companiere.verEnColores();
        } else {
           companiere.verEnCeleste();
        }
      }
    }
  }
  
  for(int i=0; i<companieres.size(); i++) {
   
    Companiere unCompaniere = companieres.get(i);
    
    for(int j=i+1; j<companieres.size(); j++) {
     
      Companiere otroCompaniere = companieres.get(j);
      
      if(unCompaniere.seAcercaA(otroCompaniere)) {
        
        if(unCompaniere.seTransformo && otroCompaniere.quiereVerEnColores()) {
          otroCompaniere.verEnColores(unCompaniere);
          
        } else if(otroCompaniere.seTransformo && unCompaniere.quiereVerEnColores()) {
          unCompaniere.verEnColores(otroCompaniere);
        
        } else if(unCompaniere.veEnCeleste() && otroCompaniere.quiereVerEnCeleste()) {
          otroCompaniere.verEnCeleste();
          
        } else if(otroCompaniere.veEnCeleste() && unCompaniere.quiereVerEnCeleste()) {
          unCompaniere.verEnCeleste();
        }
      }
    }
  }
  
  if(frameCount % 80 == 0) {
    companieres.add(new Companiere());
    companieres.add(new Companiere());
  }
}
