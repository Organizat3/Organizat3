import 'dart:html' ;

void onEditValue(Event e) {
  String entrada ;
  String query ; 
  
  entrada = ((e.target as InputElement).value).toString() ;
  query = ((e.target as Element).innerHtml) ;
  
  setValue(entrada, query) ;
}

void setValue(String value, String query) {
  querySelector(query).text = value ; 
}