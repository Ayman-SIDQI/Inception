#docker system prune -a #removes the specific container or any stopped containers and all unused images
#docker volume prune # ghadi tkon f fclean

COMPOSE_FILE := srcs/docker-compose.yml

# Targets

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  build        Build Docker images"
	@echo "  start        Start Docker Compose environment"
	@echo "  stop         Stop Docker Compose environment"
	@echo "  restart      Restart Docker Compose environment"
	@echo "  clean        Stop Docker Compose environment and remove associated resources"
	@echo "  fclean       Clean up Docker resources by removing all stopped containers and volumes"


build:
	docker compose -f $(COMPOSE_FILE) build

start:
	docker compose -f $(COMPOSE_FILE) up -d

stop:
	docker compose -f $(COMPOSE_FILE) down

restart: stop start

clean:
	docker compose -f $(COMPOSE_FILE) down
	docker rm -f $(docker ps -aq)
fclean:
	docker system prune -a
	docker volume prune

.PHONY: help build start stop restart clean fclean
