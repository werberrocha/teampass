#!/bin/bash

# Verifica se há arquivos em /var/www/html
if [ -z "$(ls -A /var/www/html)" ]; then
  # Se estiver vazio, copie os arquivos do diretório temporário
  cp -r /tmp/html/* /var/www/html/
  chown www-data:www-data  /var/www/html/* -R 
  chmod 750 /var/www/html/* -R
fi


# Verifica se há arquivos em /var/www/sk
if [ -z "$(ls -A /var/www/sk)" ]; then
  # Se estiver vazio, copie os arquivos do diretório temporário
  cp -r /tmp/sk/* /var/www/sk/
  chown www-data:www-data  /var/www/sk/* -R
  chmod 750 /var/www/sk/* -R
fi


# Verifica se há arquivos em /etc/apache2/ssl
if [ -z "$(ls -A /etc/apache2/ssl)" ]; then
  # Se estiver vazio, copie os arquivos do diretório temporário
  cp -r /tmp/certs/* /etc/apache2/ssl/
  chown www-data:www-data  /etc/apache2/ssl/* -R
  chmod 750 /etc/apache2/ssl/* -R
fi



# Inicia o Apache
exec apache2ctl -D FOREGROUND
