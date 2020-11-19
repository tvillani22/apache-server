[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/tvillani/tp_apache_server?color=g&label=dockerhub%20image&style=plastic)](https://hub.docker.com/r/tvillani/tp_apache_server)

![Docker Pulls](https://img.shields.io/docker/pulls/tvillani/tp_apache_server)


<h1 style="font-size:30px"><center>Trabajo Práctico Final: Server Apache</center></h1>

## Intro
Este repositorio tiene el Trabajo Práctico Final de la materia Administración de sistemas GNU/Linux y virtualización - 2020. El objetivo es levantar dos contenedores de Docker con un servidor Apache2 cada uno que hagan de host a tres sitios sencillos de ejemplo, accesibles por distintos puertos de la máquina.

## Antes de comenzar
En caso de ser necesario, es posible acceder al [tutorial orientativo de Docker](https://docs.docker.com/get-started/). Para cuestiones puntuales, puede revisarse la [documentación oficial](https://docs.docker.com/reference/).

## Prerequisitos
- [Docker](https://www.docker.com) - De no tenerlo, puede instalarse siguiendo las [instrucciones del sitio oficial](https://docs.docker.com/engine/install).
- [Git](https://git-scm.com) - Necesario en caso de optar por armar la imagen. También puede instalarse fácilmente siguiendo [instrucciones del sitio oficial](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/).

## Ejecución
Para correr los servidores en contenedores de docker en una máquina propia:

**1. Clonar el repo:**<br>
```
git clone https://github.com/tomlazersheep/apache-server.git
cd apache_server
```

**2. Armar la imagen:**<br>
```
docker-compose build
```

**3. Levantar el contenedor:**<br>
```
docker-compose up [-d]
```

**4. Usando un navegador se accede a los sitios en:**<br>
**Sitio 1**: `http://127.0.0.1` (o `http://localhost`)<br>
**Sitio 2**: `http://127.0.0.1:8080` (o `http://localhost:8080`)<br>
**Sitio 3**: `http://127.0.0.1:8888` (o `http://localhost:8888`)<br>
<br>
**A su vez, se puede obtener información de los contenedores corriendo con:** 
```
docker ps
docker inspect container_tp
docker inspect container2_tp 
```

**5. Para detener los contenedores**:
```
docker-compose down
```
<br>

### Alternativa I: Descargar la imagen ya armada
>Es posible también correr el servidor de uno de los contenedores desde una imagen ya armada y alojada en un [repositorio de Dockerhub](https://hub.docker.com/r/tvillani/tp_apache_server). La forma convencional de descargarla es con `docker pull tvillani/tp_apache_server:tag`, pero para adaptarlo al procedimiento descrito de la sección anterior lo más sencillo es reemplazar las líneas 5 y 6 del `docker-compose.yml` con:<br>
>```
>image: tvillani/tp_apache_server:latest
>```
>Y comenzar el procedimiento desde el punto 3 en adelante (omitiendo 1 y 2). Al levantar el contenedor, docker reconocerá que no tiene esa imagen entre las disponibles localmente y hará el `pull` desde el repositorio.

### Alternativa II: Edición del sitio con el contenedor corriendo
>El paso a paso descripto es ideal para compartir el proyecto porque contiene el procedimiento de instalación y ejecución del servidor junto con los sitios todo en una unidad (la imagen). Pero no permite la edición de los sitios en tiempo de ejecución. Una posible solución es montar la carpeta local donde está el contenido de los sitios en el path donde están sus correspondientes copias. Para ello, ejemplificando para el server del primer contenedor, basta reemplazar la línea 11 del `docker-compose.yml` con: <br>
>```
>./C1/sitios/:/var/www/
>```
>De esa forma, toda edición que se haga al contenido local se verá reflejada en los sitios que apache de ese contenedor hostea en el momento. Lógicamente la imagen no se alterará, pero es posible trabajar en las modificaciones y una vez finalizadas incorporarlas a la imagen con un `build`.

### Alternativa III: Ejecución en un swarm
>Es posible correrlo en un cluster en el ***swarm mode*** de docker, reemplazando el paso 3 con:<br>
>```
>docker swarm init
>docker stack deploy --compose-file docker-compose.yml  tp_stack
>```
>Puede verificarse su estado con `docker stack ls` y, aunque no muestre el progreso de build/run, es posible constatar cuándo el servicio ya está ejecutándose con `docker service ls`.<br>
>A su vez, corriendo de esta forma es posible escalar el servicio a `N` contenedores:
>```
>docker service scale tp_stack_server#=<N>
>```
>Con `#` dependiendo el contnedor a escalar. Y para corroborar si efectivamente se levantaron esos contenedores puede correse nuevamente `docker service ls` observando la columna **replicas**. Obviamente es posible mirar información particular de cada uno como se explicó en el paso 4, aunque en este caso, dado que pueden ser múltiples, docker ignorará el nombre asignado al container en el `docker-compose.yml`, por lo que en el segundo comando indicado se debe reemplazar `tp_container` por el nombre (o el id) del container que se obtiene del output de `docker ps`.<br>
>Para cerrar el swarm:
>```
>docker swarn leave --force
>```
<br>
<br>

<table cellspacing="0" cellpadding="100">
  <tr>
  <td> <a href=https://ubuntu.com> <img id="im" src=imgs/ubuntu_logo.svg width=300/> </a> </td>
  <td> <a href=https://www.docker.com><img id="im" src=imgs/docker_logo.png width=400/></a> </td>
  <td> <a href=https://httpd.apache.org><img id="im" src=imgs/apache_server_logo.svg width=300/></a> </td>
  </tr>
</table>