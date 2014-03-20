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
const int SQLport = 3306;
const String SQLdb = "Calendar";
const String SQLhost = "91.121.7.186";
ConnectionPool Conexion;


void main(){
  
  HttpServer.bind(webHost, webPort).then((server) {
      server.listen((HttpRequest request) {
        switch(request.uri.path){
            case "/submit":
              //JsonObject data = new JsonObject.fromJsonString(request.responseText);
              print("recibido");
              break;
            default:
              break;
        }
            
        });
      });
}



void serverHandler(HttpRequest request){
  
}

void registrar(String correo, String nombre, String contrasena, int age){
  
    Conexion = new ConnectionPool(host: SQLhost, port: SQLport, user: SQLuser, password: SQLpassword, db: SQLdb);
    Conexion.prepare(
        'insert into Usuarios (Correo, Nombre, Contrasena) values (?, ?, ?)'
      ).then((query) {
        print('prepared query insert into task');
        var params = new List();
          params.add(correo);
          params.add(nombre);
          params.add(contrasena);
        return query.execute(params);
      });  
    Conexion.close();
}

void login(){
  
}

void AddAsignatura(){
  
}









