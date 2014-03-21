import 'dart:html';
import 'dart:convert';
import 'dart:js';

void main() {
  
  FormElement form = querySelector('#login');
  ButtonElement button = querySelector('#entrar');
    
  button.onClick.listen((e) {
    var req = new HttpRequest();

    req.onReadyStateChange.listen((ProgressEvent e) {
      if (req.readyState == 4) {
        if(req.status==201){
          var contenido = req.response;
          contenido = JSON.decode(contenido);
          if(contenido["password"]==true){
            window.alert("Bienvenido");
            window.location.assign('pages/calendar.html');
          }else{
            window.alert("Error vuelve a intentarlo");
            window.location.assign('index.html');
          }
        }
      }
    });

    req.open('POST', form.action);
    req.send(JSON.encode(serializeForm(form)));
    
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


