import 'dart:html';
import 'dart:convert';
import 'dart:js';


void main(){
  
  FormElement form = querySelector('#usuario');
  ButtonElement button = querySelector('#registrar');
  
  button.onClick.listen((e) {
      var req = new HttpRequest();

      req.onReadyStateChange.listen((ProgressEvent e) {
        if (req.readyState == HttpRequest.DONE) {
          //TODO: make response in the server and check in this point
          window.location.assign("../pages/calendar.html");
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
