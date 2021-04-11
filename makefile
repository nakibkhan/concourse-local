MAKEFLAGS += --silent
all=ci-up
.PHONY: all

dc-up:
	docker-compose up --build

dc-down:
	docker-compose down -v
	sudo rm -rf keys
	sudo rm -rf vault
