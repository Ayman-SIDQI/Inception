#docker system prune -a #removes the specific container or any stopped containers and all unused images
#docker volume prune # ghadi tkon f fclean

COMPOSE_FILE := srcs/docker-compose.yml

# Targets
all:
	docker compose -f $(COMPOSE_FILE) up -d

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  build        Build Docker images"
	@echo "  stop         Stop Docker Compose environment"
	@echo "  re      Restart Docker Compose environment"
	@echo "  clean        Stop Docker Compose environment and remove associated resources"
	@echo "  fclean       Clean up Docker resources by removing all stopped containers and volumes"

build:
	docker compose -f $(COMPOSE_FILE) build

stop:
	docker compose -f $(COMPOSE_FILE) down

re: stop all

clean:
	docker compose -f $(COMPOSE_FILE) down
	docker rm -f $(docker ps -aq)
fclean:
	docker system prune -a -f 
	docker volume prune -f
	docker buildx prune -f
	rm -rf /home/asidqi/data/gf-data/*
	rm -rf /home/asidqi/data/wp-data/*
	rm -rf /home/asidqi/data/mysql/*

.PHONY: help build stop re clean fclean
