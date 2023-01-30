FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y nginx
RUN apt-get install -y openssl

EXPOSE 443

CMD ["nginx","-g","daemon off;"]
