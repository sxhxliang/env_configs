
docker pull postgres:12

mkdir /var/lib/postgresql/data

docker run -d --name postgres --restart always \
	-e POSTGRES_USER='postgres' \
	-e POSTGRES_PASSWORD='abc123' \
	-e ALLOW_IP_RANGE=0.0.0.0/0 \
	-v /home/postgres/data:/var/lib/postgresql \
	-p 5432:5432