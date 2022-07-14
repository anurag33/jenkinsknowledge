FROM ubuntu:18.04
MAINTAINER anuragkmr328@gmail.com
RUN apt-get update && apt-get install -y apache2 openssh-server openssh-client zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page275/hangover.zip /var/www/html
WORKDIR /var/www/html
RUN unzip hangover.zip
RUN cp -rvf hangover-master/* .
RUN rm -rf hangover-master hangover.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
