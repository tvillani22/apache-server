[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/tvillani/tp_apache_server?color=g&label=dockerhub%20image&style=plastic)](https://hub.docker.com/r/tvillani/tp_apache_server)

![Docker Pulls](https://img.shields.io/docker/pulls/tvillani/tp_apache_server)


<h1 style="font-size:30px"><center>Trabajo Práctico Final: Server Apache</center></h1>

## Intro
Este repo tiene el Trabajo Práctico Final de la materia Administración de sistemas GNU/Linux y virtualización - 2020. El objetivo es correr un servidor Apache en un container de Docker que haga de host a dos sitios sencillos de ejemplo, accesibles por distintos puertos de la máquina en la que está corriendo Docker.

## Prerequisitos
- [Docker](https://www.docker.com) - De no tenerlo, puede instalarse siguiendo las [instrucciones del sitio oficial](https://docs.docker.com/engine/install).
- [Git](https://git-scm.com) - Necesario en caso de optar por armar la imagen. También puede instalarse fácilmente siguiendo [instrucciones del sitio oficial](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/).

## Ejecución
Para correr el servidor en un contenedor de docker, en una máquina propia (VM o no), los pasos son los siguientes:

**1. Clonar el repo:**<br>
```
git clone https://github.com/tomlazersheep/apache-server.git
```

**2. Estando en el directorio del repositorio, armar la imagen:**<br>
```
docker-compose build
```

**3. Levantar el container:**<br>
```
docker-compose up -d
```

**4. Usando un navegador se accede a los sitios en:**<br>
**Sitio 1**: `http://127.0.0.1` (o simplemente `http://localhost`)<br>
**Sitio 2**: `http://localhost:8080` (o simplemente `http://localhost:8080`)<br>
<br>
**A su vez, se puede obtener información del contenedor corriendo con:** 
```
docker ps
docker inspect container_tp 
```


**5. Para terminar**:
```
docker-compose down
```