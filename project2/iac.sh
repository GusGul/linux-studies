#!/bin/bash

echo "Atualizando o servidor..."

apt update && apt upgrade -y
apt install apache2 -y
apt install unzip -y

echo "Baixando a aplicação..."

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -O /tmp/main.zip
unzip /tmp/main.zip -d /tmp
cp -r /tmp/linux-site-dio-main/* /var/www/html/
systemctl restart apache2

echo "Aplicação instalada com sucesso!"
