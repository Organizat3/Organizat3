import 'dart:io';
import 'dart:convert';
import "package:json_object/json_object.dart";
import 'package:sqljocky/sqljocky.dart';
import 'package:sqljocky/utils.dart';
import 'package:http_server/http_server.dart';

const String webHost = "127.0.0.1";
const int webPort = 8888;
const String SQLuser = "root";
const String SQLpassword = "MbP2FrrWdvsu";
const int SQLport = 37184;
const String SQLdb = "Calendar";
const String SQLhost = "91.121.7.186";
ConnectionPool Conexion;
Map datos;

void main(){
  
  HttpServer.bind(webHost, webPort).then((server) {
      server.listen((HttpRequest request) {
        request.listen((List<int> buffer){
          var jsonString = new String.fromCharCodes(buffer);
          datos = JSON.decode(jsonString);
        });

        switch(request.uri.path){
              case "/submit":
                registrar(datos);
                datos = {};
                break;
              default:
                break;
        }
      });
      });
}



void serverHandler(HttpRequest request){
  
}

void registrar(Map datos){
  
    Conexion = new ConnectionPool(host: SQLhost, port: SQLport, user: SQLuser, password: SQLpassword, db: SQLdb);
    Conexion.prepare(
        'insert into Usuarios (Correo, Nombre, Apellido, Contrasena, FechaNacimiento,) values (?, ?, ?, ?, ?)'
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

void login(){
  
}

void AddAsignatura(){
  
}









