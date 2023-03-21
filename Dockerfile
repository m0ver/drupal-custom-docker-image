FROM drupal:10.0

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y libssh2-1-dev libssh2-1
RUN pecl install ssh2-1.3.1 && docker-php-ext-enable ssh2

RUN { \
    echo 'memory_limit = 196M'; \
    echo 'display_errors = Off'; \
    echo 'post_max_size = 64M'; \
    echo 'file_uploads = On'; \
    echo 'upload_max_filesize = 64M'; \
    echo 'max_file_uploads = 20'; \
} > /usr/local/etc/php/conf.d/codekoalas-settings.ini
