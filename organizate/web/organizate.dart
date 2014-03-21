import 'dart:html';
import 'dart:convert';
import 'dart:js';

void main() {
  
  FormElement form = querySelector('#entrar');
  ButtonElement button = querySelector('#login');
  
  window.alert("hasta aqui");  
  
  button.onClick.listen((e) {
    var req = new HttpRequest();

    req.onReadyStateChange.listen((ProgressEvent e) {
      if (req.readyState == HttpRequest.DONE) {
        print('Data submitted!');
   
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


