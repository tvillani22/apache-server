FROM ubuntu:20.04

ENV TZ=America/Argentina/Buenos_Aires

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt -y install apache2 php && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/apache2/sites-available/

COPY sitios/ /var/www/

COPY conf/* ./

COPY ports.conf ../

RUN a2ensite sitio1.conf ; a2ensite sitio2.conf ; a2ensite sitio2_8080.conf; \
     rm 000-default.conf; echo 'ServerName 127.0.0.1' >> ../apache2.conf 

EXPOSE 80 8080

CMD ["apachectl", "-D", "FOREGROUND"]

