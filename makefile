MAKEFLAGS += --silent
all=ci-up
.PHONY: all

dc-up:
	docker-compose up --build

dc-down:
	docker-compose down -v
	rm -rf keys
	rm -rf vault
