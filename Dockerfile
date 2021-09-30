FROM nginx:1.21.3

RUN apt-get -y update
RUN chmod +w /etc/nginx/nginx.conf
COPY  ./default.conf  /etc/nginx/conf.d/default.conf

COPY ./app  ./app

EXPOSE 80


CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
