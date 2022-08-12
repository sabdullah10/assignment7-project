FROM fedora:latest
RUN dnf -y upgrade \
 && dnf -y install httpd \
 && mkdir /structure \ 
 && chmod 777 /structure \
 && useradd collin
COPY index.html /var/www/html/index.html
EXPOSE 80
USER sync
RUN mkdir /structure/sync-work
USER nobody
RUN mkdir /structure/nobody-work
USER root
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

