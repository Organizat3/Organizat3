library models;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:polymer_expressions/filter.dart' show Transformer;
import 'dart:io';
import 'package:http_server/http_server.dart';


class Person extends Object with Observable {
  @observable String Nombre;
  @observable String Apellidos;
  @observable int Edad = 0;
}
@CustomTag('person-form')
class PersonForm extends PolymerElement {
  final Person person = new Person();

  PersonForm.created() : super.created();

  @published String action;

  doSubmit(Event e, var detail, Node target) {
    e.preventDefault();

    FormElement form = target as FormElement;
    form.action = action;

    HttpRequest.request(action,
          method: form.method,
          sendData: new FormData(form))
        .then((HttpRequest req) {
          shadowRoot.querySelector('#message').text = req.responseText;
        })
        .catchError((e) => print(e));
  }

  // Filters and transformers can be referenced as fields.
  final Transformer asInteger = new StringToInt();
}