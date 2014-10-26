# Rest service Twitter Clone

proyecto: [Twitter-clone](https://github.com/bmonsalves/bdo-twitterClone)  

###Para correr api
-------------------------------------
####Clonar y ejecutar Ejecutar
$ cd bdo-twitterClone  
$ [sudo] gem install bundler  
$ bundle install  
$ rake migrate  
$ ruby main.rb  


###Consumir api
------------------------------------
####GET (todos)
http://localhost:4567/api/users

####GET (uno)
http://localhost:4567/api/users/:id


####POST
http://localhost:4567/api/users  

Request body:  
{  
  "user": "usuario1",  
  "password": "passuser1"  
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