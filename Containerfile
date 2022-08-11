FROM fedora:latest
RUN dnf -y upgrade \
 && dnf install httpd
COPY index.html /var/www/html/index.html
EXPOSE 80
USER root
WORKDIR /structure
RUN chmod 777
USER collin
USER sync
WORKDIR /structure/sync-work
USER nobody
WORKDIR /structure/nobody-work
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

