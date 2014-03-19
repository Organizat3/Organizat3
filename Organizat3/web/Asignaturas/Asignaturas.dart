import 'dart:html' ; 
import '../Interaccion/Interaccion.dart' ;

void drawGUI() {
  
}

void getValues() {
  
}

void refreshGUI() {
   
}

void onEditValue(Event e) {
  String entrada = ((e.target as InputElement).value).toString() ;
  e.target.id 
}

void setValue(String e) {
    
  
}


void main() {
  querySelector('#botonNuevo').onClick.listen(onNewButton) ;
  querySelector('#nombreAsignatura').onClick.listen(onEditValue) ; 
}
