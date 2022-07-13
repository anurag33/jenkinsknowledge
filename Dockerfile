FROM ubuntu:18.04
MAINTAINER anuragkmr328@gmail.com
RUN apt-get update && apt-get install -y apache2 openssh-server openssh-client python zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/nurgo.zip /var/www/html
WORKDIR /var/www/html
RUN unzip nurgo.zip
RUN cp -rvf html/* .
RUN rm -rf html nurgo.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80

