# VARIABLES


NAME	= Ft_transcendence


# DIRS

SRC_DIR = ./srcs/docker-compose.yml


# COMMANDS MACROS

DOCKER_C = docker-compose



# RULES

all: $(NAME)

$(NAME):
	sudo mkdir -p /home/jcuzin/data/wordpress /home/jcuzin/data/mariadb
	sudo chmod +wr /home/jcuzin/data/wordpress /home/jcuzin/data/mariadb
	$(DOCKER_C) -f $(SRC_DIR) up --build -d

down:
	$(DOCKER_C) -f $(SRC_DIR) down

stop:
	$(DOCKER_C) -f $(SRC_DIR) stop

clean:
	$(DOCKER_C) -f $(SRC_DIR) down -v --rmi all

prune:
	docker system prune -f --all

fclean: clean prune
	sudo rm -rf ~/data/*
	

restart: down all

re: fclean all



# .SILENT:

.PHONY: all