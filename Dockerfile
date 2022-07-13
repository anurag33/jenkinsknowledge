FROM ubuntu:18.04
MAINTAINER anuragkmr328@gmail.com
RUN apt-get update && apt-get install -y apache2 openssh-server openssh-client python zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/*
RUN rm -rf __MACOSX markups-kindle kindle.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
