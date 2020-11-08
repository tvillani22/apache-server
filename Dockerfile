FROM ubuntu:20.04

ENV TZ=America/Argentina/Buenos_Aires

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt -y install apache2 php && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/apache2/sites-available/

COPY sitios/ /var/www/

COPY apache2.conf ports.conf  ../

RUN rm 000-default.conf

EXPOSE 80 8080

CMD ["apachectl", "-D", "FOREGROUND"]

