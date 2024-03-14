FROM debian:bullseye

RUN apt update -y

RUN apt-get install wget -y

RUN apt-get install -y php7.4
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://fr-be.wordpress.org/latest-fr_BE.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest-fr_BE.tar.gz && rm latest-fr_BE.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN	mkdir -p /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp_script.sh /bin/
RUN chmod +x /bin/wp_script.sh

ENTRYPOINT ["sh", "/bin/wp_script.sh"]