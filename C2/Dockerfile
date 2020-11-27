FROM server1:latest

RUN apt update && apt -y install php php-mysql && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/apache2/sites-available/

COPY sitios/ /var/www/

COPY apache2.conf  ../

EXPOSE 8888

CMD ["apachectl", "-D", "FOREGROUND"]

