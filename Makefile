# VARIABLES


NAME	= Ft_transcendence


# DIRS

SRC_DIR = ./srcs/docker-compose.yml


# COMMANDS MACROS

DOCKER_C = docker-compose



# RULES

all: $(NAME)

$(NAME):
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
	

restart: down all

re: fclean all



# .SILENT:

.PHONY: all