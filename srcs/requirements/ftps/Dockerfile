FROM alpine

RUN apk update
RUN apk add lftp gettext vsftpd openrc --no-cache

ARG FTP_USER=user
ARG FTP_PASS=password

RUN { echo "$FTP_PASS"; echo "$FTP_PASS"; } | adduser "$FTP_USER"

COPY ./vsftpd.conf /tmp
COPY ./ssl /etc/ssl

RUN touch /etc/vsftpd.chroot_list
RUN echo "set ssl:verify-certificate no" >> /etc/lftp.conf
RUN mkdir /var/ftp
RUN mkdir /var/ftp/pub
RUN chmod 2775 /var/ftp/pub

COPY ./entry.sh /entry.sh

# CMD ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "sh", "/entry.sh" ]
CMD ["vsftpd", "vsftpd.conf"]
