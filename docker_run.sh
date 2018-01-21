docker run --name some-nginx -p 8080:80 -v $HOME/Downloads/repos/volume_www:/usr/share/nginx/html -d nginx

#  to adapt the default configuration
docker run --name tmp-nginx-container -d nginx
docker cp tmp-nginx-container:/etc/nginx/nginx.conf $HOME/Downloads/repos/docker_stuff/nginx.conf
docker rm -f tmp-nginx-container

##
docker run --name some-mysql -p 3306:3306 -v named_volume:/var/lib/mysql -e MYSQL_USER="sammy" -e MYSQL_PASSWORD="sammy" -e MYSQL_DATABASE="affablebean" -e MYSQL_ROOT_PASSWORD="known-secret" -d mysql:5.7.19
docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql

mysql -u sammy -p"sammy" -h 127.0.0.1 < ../affablebean_schema_creation.sql
mysql -u sammy -p"sammy" -h 127.0.0.1 -A affablebean

##
#docker run --name some-apache -p 8080:8080 -v $PWD/www:/var/www/html -e APACHE_RUN_USER=1000 -e APACHE_RUN_GROUP=100 -d antage/apache2-php5
