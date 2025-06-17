# Use Debian:12.7 como base
FROM debian:12.7


# Versao do Teampass
LABEL version=3.1.4.23


# Atualizar e instalar dependências do Apache2, OpenSSL e PHP
RUN apt-get update && \
    apt-get install -y apache2 openssl git && \
    apt-get install -y php8.2 php8.2-bcmath php8.2-curl php8.2-gd php8.2-gmp \
    php8.2-iconv php8.2-ldap php8.2-mbstring php8.2-mcrypt php8.2-mysqli \
    php8.2-xml git 

# Ativar módulo SSL do Apache2
RUN a2enmod ssl

# Configuração do PHP.ini
RUN echo "max_execution_time = 60" >> /etc/php/8.2/apache2/php.ini

# Cria pasta SK
RUN mkdir /var/www/sk && chown www-data:www-data /var/www/sk -R  && chmod 750  /var/www/sk -R

# Copiar o arquivo de configuração SSL para o Apache2
COPY apache-ssl.conf /etc/apache2/sites-available/default-ssl.conf

# Criar pasta temporaria
RUN mkdir /tmp/html && mkdir /tmp/sk && mkdir /tmp/certs

# Copiar os arquivos da instalado do Teampas 3.1.4.23
COPY files/ /tmp/html/
COPY files_sk/ /tmp/sk/
COPY certs/ /tmp/certs/


# Configurações para os volumes dos certificados e arquivos www
VOLUME ["/etc/apache2/ssl", "/var/www/html", "/var/www/sk"]

# Copiar o script entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ativar site SSL do Apache2
RUN a2ensite default-ssl

# Expor a porta 443 para HTTPS
EXPOSE 443

# Iniciar o Apache2 em foreground
#CMD ["apache2ctl", "-D", "FOREGROUND"]

# Definir Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
