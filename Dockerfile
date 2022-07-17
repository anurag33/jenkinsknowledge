FROM ubuntu:18.04
MAINTAINER anuragkmr328@gmail.com
RUN apt-get update && apt-get install -y apache2 openssh-server openssh-client zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/jon.zip /var/www/html
WORKDIR /var/www/html
RUN unzip jon.zip
RUN cp -rvf jon/* .
RUN rm -rf jon jon.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
