FROM debian:buster

RUN apt update && apt install -y vsftpd 

ARG FTP_USER=user
ARG FTP_PASS=password

RUN mkdir -p /var/run/vsftpd/empty && chmod 0755 /var/run/vsftpd/empty

RUN { echo "$FTP_PASS"; echo "$FTP_PASS"; } | adduser "$FTP_USER"

COPY ./vsftpd.conf /tmp
COPY ./ssl /etc/ssl

# CMD ["tail", "-f", "/dev/null"]
CMD ["vsftpd", "/tmp/vsftpd.conf"]
