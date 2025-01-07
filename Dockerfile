FROM ubuntu

WORKDIR /app

RUN  apt-get update && apt-get install apache2 -y

ADD index.html /var/www/html/

EXPOSE 80

CMD [ "/usr/sbin/apache2ctl" , "-D" , "FOREGROUND" ]
