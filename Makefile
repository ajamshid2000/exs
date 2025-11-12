
all: prepare_directories build up

prepare_directories:
	sudo mkdir -p $(HOME)/data/mariadb
	sudo mkdir -p $(HOME)/data/wordpress

build:
	sudo chmod 777 /var/run/docker.sock
	docker compose -f ./srcs/docker-compose.yml build

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

restart: down up

re: clean all

status:
	docker compose -f ./srcs/docker-compose.yml ps -a


clean:
	docker compose -f ./srcs/docker-compose.yml down -v

prune:
	docker system prune --all --force


bashmariadb:
	docker exec -it mariadb /bin/bash

bashnginx:
	docker exec -it nginx /bin/bash

bashwordpress:
	docker exec -it wordpress /bin/bash


.PHONY: all prepare_directories build up down strop start restart re status remove clean prune bashmariadb bashnginx bashwordpress
