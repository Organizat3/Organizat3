import 'dart:io';
import 'dart:convert';
import 'package:json_object/json_object.dart';
import 'package:sqljocky/sqljocky.dart';
import 'package:sqljocky/utils.dart';
import 'package:http_server/http_server.dart';

//Datos de autentificacion y validacion del servidor
const String webHost = "127.0.0.1";
const int webPort = 8888;
const String SQLuser = "josef267";
const String SQLpassword = "123456";
const int SQLport = 3306;
const String SQLdb = "calendario";
const String SQLhost = "localhost";
ConnectionPool Conexion;
Map datos;

/**
 * Ejecucion del servidor 
 */
void main(){
  
  HttpServer.bind(webHost, webPort).then((server) {
      server.listen((HttpRequest request) {
        request.listen((List<int> buffer){
          var jsonString = new String.fromCharCodes(buffer);
          datos = JSON.decode(jsonString);
          print(datos["correo"]);
          
          switch(request.uri.path){
                case "/submit":
                  registrar(datos);
                  //datos = {};
                  break;
                default:
                  break;
          }
        });
      });
    });
}

void serverHandler(HttpRequest request){
  
}

/**
 * Registro de un nuevo usuario (nivel de servidor)
 * @param datos: Datos recopilados del registro (usuario)
 */
void registrar(Map datos){
  
    Conexion = new ConnectionPool(host: SQLhost, port: SQLport, user: SQLuser, password: SQLpassword, db: SQLdb);
    Conexion.prepare(
        'insert into Usuario (Correo, Nombre, Apellido, Contrasena, FechaNacimiento) values (?, ?, ?, ?, ?)'
      ).then((query) {
        print('prepared query insert into task');
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

/**
 * Login de un usuario
 */
void login(){
  
}

void AddAsignatura(){
  
}









