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
Map datos;

//TODO: manejar excepciones. 
//TODO: generar salt y anadir cifrado de contrasena sha2. 

//------------------------------------------------
//TODO:
//  -Consultar
//  -Enviar respuestas
//------------------------------------------------


void main(){
  
  HttpServer.bind(webHost, webPort).then((server) {
      server.listen((HttpRequest request) {
        request.listen((List<int> buffer){
          var jsonString = new String.fromCharCodes(buffer);
          datos = JSON.decode(jsonString);
          
          //TODO: comprobar que datos no esta vacio
          //es decir, se han recibido los datos bien. 
          switch(request.uri.path){
                case "/submit":
                  registrar(datos);
                  datos = {};
                  break;
                case "/login":
                  login(datos);
                  datos = {};
                  break;
                case "/addasignatura":
                  datos = {};
                  break;
                default:
                  
                  break;
          }          
        });
      });
      });
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

void login(Map datos){
    //TODO: login comprobando salt+password  
}

void AddAsignatura(Map datos){
  
}

void RemoveAsignatura(Map datos){
  
}









