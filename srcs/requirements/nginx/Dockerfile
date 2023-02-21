FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/cert

RUN openssl req \ 
# basic command to generate certificate request
-newkey \
# create a new key that will be use to signed the certificate
rsa:4096 \
# precice the algorythme to use for the key generation and the number of byte use for this algorythm
-nodes \
# no key encryption so no passphrase prompt
-x509 \
# transform the certificate request into a self signed certificate
-days 365 \
# overzrite the default validity time of the self signed certificate from 30 days to 365
-keyout /etc/cert/key.pem \
# tell where to store the generated key
-out /etc/cert/cert.pem \
# tell where to store the certificate
-subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=jrinna testfloor/CN=www.jrinna.42.fr"

EXPOSE 443

COPY ./nginx.conf /etc/nginx/conf.d

CMD ["nginx","-g","daemon off;"]
