FROM ubuntu

WORKDIR /app

RUN  apt-get update && apt-get install apache2 --yes

ADD index.html /var/www/html/

EXPOSE 82

CMD [ "/usr/sbin/apache2ctl" , "D" , "FOREGROUBND" ]

