#!/usr/bin/env bash

ROOT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

#####################################################################
#               For secure signing of NGINX server
#####################################################################

# Creating the Nginx certificates and placing to appropriate directory
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/C=US/ST=Washington/L=Seattle/O=Amazon.com Inc./OU=Amazon Web Services/CN=deepracer.io'

# Creating the webserver default username and password (deepracer)
python $ROOT_DIR/reset_default_password.py
