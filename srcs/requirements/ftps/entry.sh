envsubst '\$FTP_ROOT' < /tmp/vsftpd.conf > /vsftpd.conf

exec "$@"