import 'dart:html';
import 'dart:convert';
import 'dart:js';

void main() {
  
  FormElement form = querySelector('#login');
  ButtonElement button = querySelector('#entrar');
  
  button.onClick.listen((e) {
    var req = new HttpRequest();

    req.onReadyStateChange.listen((ProgressEvent e) {
      if (req.readyState == HttpRequest.DONE) {
        print('Data submitted!');
   
      }
    });

    req.open('POST', form.action);
    req.send(JSON.encode(serializeForm(form)));
    
    var respuesta = req.response;
    respuesta = JSON.decode(respuesta);
    if(respuesta["login"]==true){
      window.alert("HIJO DE PUTA, correcto");
    }else{
      window.alert("Ni una ni dos ni tres, si no cero.");
    }
    
  });
}

serializeForm(FormElement form) {

  var data = {};
  
  form.querySelectorAll('input,select').forEach((Element el) {
    if (el is InputElement)
      data[el.name] = el.value;
  });
  
  return data;
}


