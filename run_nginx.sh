#!/bin/bash

docker container run -d --name mynginx -p 80:80 -v ./app:/var/www/html -v ./default.conf:/etc/nginx/conf.d/default.conf:ro  mynginx

