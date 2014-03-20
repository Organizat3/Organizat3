import "dart:io";

const String Host = "localhost";
const int Port = 80;


void main(){
  HttpServer.bind(Host, Port).then((HttpServer server){
    server.listen(resquestHandler);
  });
}

void resquestHandler(HttpRequest request){
  //TODO: manejador de respuestas post.
  //Resquest listen. JSON? and HttpResponse
}


