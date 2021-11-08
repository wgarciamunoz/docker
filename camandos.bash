#Dangling images
docker images -f dangling=true -q | xargs docker rmi
#Eliminar imagenes
docker images 
docker rmi xxxx
#Listar contenedores  que están corriendo
docker ps
#Eliminar Container
docker ps -q | xargs docker rm -f
docker rm -fv ****

docker ps -a
#
vi Dockerfile
#
docker build --tag apache-centos1 .

# Correr docker en segundo plano -d
docker container run -it -d --name tomcatcontainer1 -p 8081:8080 apache-centos1
#docker run -it -d --name tomcatcontainer1 -p 8081:8080 apache-centos1
#
 How to start and stop the container 

docker stop <containername/id>  # to stop the container which is running in background mode
docker container start <containername/id> # to start the already stopped container

#Conectarse al contenedor por terminal

docker exec -u root -ti tomcatcontainer1 bash
# monitoring the Container 

docker container list # list the containers created
docker container ls -a  #to list the containers including not running containers
docker ps    #to list the running container
docker info #docker engine status including container running/paused/stopped containers list
docker container stats <containername/id> #prints the CPU and MEM usage data of the container name
docker container stats #prints the CPU and MEM usage of all running containers
docker container top <containername/id> #executes the top command in the container specified, fails if the specified container is not running

# How to remove/delete the container

docker container rm <containername/id> # Remove the Container 

# How to remove/delete the image

docker container rmi <imagename/imageid> # Remove the image
# How to view the logs of the running container

docker container logs <containername/id> # to view the logs of the container 

/***** MYSQL  ******/

docker pull mysql:5.7.31
docker run --name mysqldesarrollo -p 3333:3306 -e MYSQL_ROOT_PASSWORD=Cucuta.2021$ -e MYSQL_DATABASE=datosdb -e MYSQL_USER=wigamu -e MYSQL_PASSWORD=Cucuta.2021$ -d mysql:5.7.31
docker inspect mysqldev
mysql -u root -h 172.17.0.4 -pCucuta.2021$


#Limitar recursos a un contenedor
docker stats mysqldesarrollo
free -h
docker run --help | grep memo # -m
docker run --name mysqldesarrollo -m "200mb" -p 3333:3306 -e MYSQL_ROOT_PASSWORD=Cucuta.2021$ -e MYSQL_DATABASE=datosdb -e MYSQL_USER=wigamu -e MYSQL_PASSWORD=Cucuta.2021$ -d mysql:5.7.31

#Para mirar cuanta cuántas CPU tenemos en una máquina Linux
grep "model name" /proc/cpuinfo
docker run --help | grep cpu #--cpuset-cpus

 docker run --name mysqldesarrollo -m "200mb" --cpuset-cpus 0-1 -p 3333:3306 -e MYSQL_ROOT_PASSWORD=Cucuta.2021$ -e MYSQL_DATABASE=datosdb -e MYSQL_USER=wigamu -e MYSQL_PASSWORD=Cucuta.2021$ -d mysql:5.7.31

#Copiar archivos desde nuestra maáquina a un contenedor
cd /home/centos/docker-images
touch "hola" > file1.txt
docker cp file1.txt tomcatcontainer1:/tmp
docker exec -u root -ti tomcatcontainer1 bash

#Copiar archivos desde el contenedor a la máquina

docker cp tomcatcontainer1:/tmp/file1.txt .

# Convierte un contenedor en una imagen
# tomar el estado de un contenedor que está corriendo y
# transformarlo en una imagen.

docker commit tomcatcontainer1 tomcatcontainer1-back