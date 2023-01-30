FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server
RUN service mysql start

EXPOSE 3306

CMD ["mysqld", "--bind_address=0.0.0.0"]
