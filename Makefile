all: build

build: clean
	mkdir -p ~/data/mariadb_data
	mkdir -p ~/data/wordpress_data
	sudo sed -i 's/127.0.0.1  localhost/127.0.0.1  dopeyrat.42.fr/' /etc/hosts
	sudo docker-compose -f srcs/docker-compose.yml up --build

up: down
	mkdir -p ~/data/mariadb_data
	mkdir -p ~/data/wordpress_data
	sudo sed -i 's/127.0.0.1  localhost/127.0.0.1  dopeyrat.42.fr/' /etc/hosts
	sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down

clean:
	sudo docker-compose -f srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -rf ~/data
	sudo rm -rf ~/data
	sudo sed -i 's/127.0.0.1  dopeyrat.42.fr/127.0.0.1  localhost/' /etc/hosts

.PHONY: all build up down clean