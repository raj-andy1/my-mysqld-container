FROM mysql:5.7

MAINTAINER Andy Rajagopalan <andy.rajag@gmail.com>

ENV MYSQL_DATABASE=BucketList
RUN apt-get update && \
apt-get install -y sed
RUN sed -i "s|#bind-address\t= 127.0.0.1|bind-address = 0.0.0.0|g" /etc/mysql/mysql.conf.d/mysqld.cnf
VOLUME  ["/etc/mysql", "/var/lib/mysql"]
ADD BucketList.sql /docker-entrypoint-initdb.d
EXPOSE 3306