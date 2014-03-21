import 'dart:io';
import 'dart:convert';
import 'package:sqljocky/sqljocky.dart';
import 'package:http_server/http_server.dart';

const String webHost = "127.0.0.1";
const int webPort = 8888;
const String SQLuser = "josef267";
const String SQLpassword = "123456";
const int SQLport = 3306;
const String SQLdb = "calendario";
const String SQLhost = "localhost";
ConnectionPool Conexion;
var Contenido;

//TODO: manejar excepciones. 
//TODO: generar salt y anadir cifrado de contrasena sha2. 

//------------------------------------------------
//TODO:
//  -Consultar
//------------------------------------------------

void main(){
  
  //TODO: modularizarlo en funciones 
  
  HttpServer.bind(webHost, webPort).then((server) {
      server.listen((HttpRequest request) {
        request.listen((List<int> buffer){
          var jsonString = new String.fromCharCodes(buffer);
          Map datos = JSON.decode(jsonString);
          
          //TODO: comprobar que datos no esta vacio
          //es decir, se han recibido los datos bien. 
          switch(request.uri.path){
                case "/registro":
                  registrar(datos);
                  datos = {};
                  break;
                case "/usuario":
                  Contenido = login(datos);
                  Contenido = JSON.encode(Contenido);
                  datos = {};
                  break;
                case "/addasignatura":
                  datos = {};
                  break;
                default:
                  print("default");
                  break;
          }          
        });
        Respuesta(request);
      });
      });
}

void Respuesta(HttpRequest request){
  if(Contenido!=null){
    request.response
      ..headers.add('Access-Control-Allow-Origin', '*')
      ..headers.add('Content-Type', 'application/x-www-form-urlencoded')
      ..headers.add("Accept", "application/json")
      ..statusCode = 201
      ..write(Contenido)
      ..close();
  }else{
    request.response
      ..headers.add('Access-Control-Allow-Origin', '*')
      ..headers.add('Content-Type', 'text/plain')
      ..statusCode = 500
      ..write("Error")
      ..close(); 
  }
}

//TODO: devolver un Map: si se ha conseguido o no, y el error. 
void registrar(Map datos){
  
    Conexion = new ConnectionPool(host: SQLhost, port: SQLport, user: SQLuser, password: SQLpassword, db: SQLdb);
    Conexion.prepare(
        'insert into Usuario (Correo, Nombre, Apellido, Contrasena, FechaNacimiento) values (?, ?, ?, ?, ?)'
      ).then((query) {
        var params = new List();
          params.add(datos["correo"]);
          params.add(datos["nombre"]);
          params.add(datos["apellido"]);
          params.add(datos["contrasena"]);
          params.add(datos["nacimiento"]);
        return query.execute(params);
      });
    
    Conexion.close();
}


Map login(Map datos){
  
  var request = {};
  /*
  request["login"]=false;
  Conexion.prepare('Select * from Usuario where Correo= ?').then((query) {
        return query.execute(datos["correo"]).then((result){
          result.listen((row){
            if(row["Contrasena"]==datos["password"]){
              request["login"]=true;
            };
          });
        });
  });
  return request;
  */
  request["password"]=true;
  return request;
}

void addAsignatura(Map datos){
 /* Conexion = new ConnectionPool(host: SQLhost, port: SQLport, 
      user: SQLuser, password: SQLpassword, db: SQLdb);*/

}

void getAsignaturas(Map datos){
  
}

void removeAsignatura(Map datos){
  
}

void setAjustes(){
  
}








