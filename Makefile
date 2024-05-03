PHONEY: clean down up default remove-containers stop-all

default:
	@echo "make <target>"

remove-containers: clean
	@docker ps --all --quiet | xargs -L 1 -n 1 docker rm

remove-images:
	@docker image ls --all --quiet | xargs -L 1 -n 1 docker rmi
	
clean:
	@docker volume prune --force

down:
	@docker compose down

up: down clean
	@docker compose up --build
