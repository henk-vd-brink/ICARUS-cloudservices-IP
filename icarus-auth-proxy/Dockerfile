FROM nginx:1.19.7

ENV HOME=/home/docker_user

COPY certs/nginx-selfsigned.crt /etc/ssl/certs/nginx.crt
COPY certs/nginx-selfsigned.key /etc/ssl/private/nginx.key

COPY nginx-custom.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443