FROM ubuntu

WORKDIR /app

RUN sudo apt update && sudo apt install apache2

ADD website/index.html /var/www/html/

EXPOSE 82

CMD ["systemctl", "start" ,"apache2"]

