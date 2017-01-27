#!/bin/bash

# Need to get off port 443 to renew cert. Wonder how I can do this without downtime...
cd ~/www/docker-compose stop

# Renew cert + move it over to where it needs to live for Docker to pick it up.
letsencrypt renew
rm -rf ~/www/ssl/letsencrypt
cp -rv /etc/letsencrypt/ ~/www/ssl/

# Rebuild and startup docker again.
cd ~/www/
docker-compose up --build -d
