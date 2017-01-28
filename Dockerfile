FROM nginx

MAINTAINER Matt Gowie

RUN rm /etc/nginx/conf.d/default.conf

COPY src/ /usr/share/nginx/html/

COPY ssl/letsencrypt/live/mpskill.com/fullchain.pem /etc/ssl/certs/fullchain.pem
COPY ssl/letsencrypt/live/mpskill.com/privkey.pem /etc/ssl/certs/privkey.pem
COPY ssl/dhparam.pem /etc/ssl/certs/dhparam.pem

COPY nginx.conf /etc/nginx/conf.d/default.conf
