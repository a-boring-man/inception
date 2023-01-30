FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y php
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y curl
RUN apt-get install -y mariadb-client

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
