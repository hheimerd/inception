FROM debian:buster

RUN apt update
RUN apt install -y ufw proftpd

# RUN ufw allow 20,21,60000:65535/tcp

CMD ["tail", "-f", "/dev/null"]













# RUN apt install -y gettext vsftpd 

# ARG FTP_USER=user
# ARG FTP_PASS=password

# RUN mkdir -p /var/run/vsftpd/empty && chmod 0755 /var/run/vsftpd/empty

# RUN { echo "$FTP_PASS"; echo "$FTP_PASS"; } | adduser "$FTP_USER"

# COPY ./vsftpd.conf /tmp
# COPY ./ssl /etc/ssl

# COPY ./entry.sh /entry.sh

# # CMD ["tail", "-f", "/dev/null"]
# ENTRYPOINT [ "sh", "/entry.sh" ]
# CMD ["vsftpd", "vsftpd.conf"]
