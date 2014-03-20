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
//  -Enviar respuestas
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
                case "/submit":
                  registrar(datos);
                  datos = {};
                  break;
                case "/login":
                  Contenido = login(datos);
                  
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
        
        request.response
          ..statusCode = HttpStatus.OK
          ..write(JSON.encode(Contenido))
          ..close()
          ;
        
      });//fin server
      });
}


void Respuesta(HttpResponse resp){
    
  
}

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
  
  Conexion.prepare('Select * from Usuario where Correo= ?').then((query) {
        return query.execute(datos["correo"]).then((result){
          result.listen((row){
            if(row["password"]==datos["password"]){
              return request["login"]=true;
            };
          });
        });
  });
  
  return {};
}

void addAsignatura(Map datos){
  Conexion = new ConnectionPool(host: SQLhost, port: SQLport, 
      user: SQLuser, password: SQLpassword, db: SQLdb);

}

void getAsignaturas(Map datos){
  
}

void removeAsignatura(Map datos){
  
}

void setAjustes(){
  
}








