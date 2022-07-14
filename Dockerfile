FROM ubuntu:18.04
MAINTAINER anuragkmr321@gmail.com
RUN apt-get update && apt-get install -y apache2 openssh-server openssh-client python zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/justice.zip /var/www/html
WORKDIR /var/www/html
RUN unzip justice.zip
RUN cp -rvf lawyer-website-template/* .
RUN rm -rf lawyer-website-template justice.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
