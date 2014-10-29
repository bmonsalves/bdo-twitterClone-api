# Rest service Twitter Clone

proyecto: [Twitter-clone](https://github.com/bmonsalves/bdo-twitterClone)  
-------------------------------------
###Para correr api

####Clonar y ejecutar Ejecutar
$ cd bdo-twitterClone  
$ [sudo] gem install bundler  
$ bundle install  
$ rake migrate  
$ ruby main.rb  

------------------------------------
####codigos de respuesta

codigos 	descripcion  
200			success  
201			success - nuevo recurso creado  
204			success - no hay contenido para responder  
400			bad request - i.e. su solicitud no se pudo evaluar  
401			unauthorized - usuario no esta autenticado para este recurso  
404			not found - recurso no existe  
422			unprocessable entity - i.e. errores de validacion  
429			limite de uso exedido, intente mas tarde  
500			error del servidor  
503			servicio no disponible  

------------------------------------
###Consumir api

####GET (todos)
http://localhost:4567/api/users

####GET (uno)
http://localhost:4567/api/users/:id

####POST (registro)  
http://localhost:4567/api/users/register  

Request body:  
{  
  "name": "nameuser",  
  "email": "email@email.cl",  
  "user": "user1", 
  "password": "passuser1"  
}  

Response body:  
{  
	"codigo": "codigo",  
	"token": "asdfdfafdsafdafddsaf"  
}  

####POST (login)
http://localhost:4567/api/users/login/  

Request body:  
{  
  "user": "usuario1",  
  "password": "passuser1"  
}  

Response body:  
{  
	"codigo": "codigo",  
	"token": "asdfdfafdsafdafddsaf"  
} 

####PUT
http://localhost:4567/api/users/:id  
Request body:  
{  
  "user": "usuario1",  
  "password": "passuser1"  
} 

####DELETE
http://localhost:4567/api/users/:id 