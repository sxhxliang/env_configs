docker pull mysql:5.6
docker run --name mysql --net=host -e MYSQL_ROOT_PASSWORD='tars123456' -d -p 3306:3306 \
        -v/etc/localtime:/etc/localtime \
        -v /data/mysql-data:/var/lib/mysql mysql:5.6


docker pull mysql:5.7
docker run --name mysql --net=host -e MYSQL_ROOT_PASSWORD='tars123456' -d -p 3306:3306 \
        -v/etc/localtime:/etc/localtime \
        -v /etc/mysql/my.cnf:/etc/mysql/my.cnf \
        -v /data/mysql-data:/var/lib/mysql mysql