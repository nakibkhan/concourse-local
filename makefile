MAKEFLAGS += --silent
all=ci-up
.PHONY: all

dc-up:
	./generate-keys.sh
	./start.sh
	echo "Finished $@."

dc-down:
	docker-compose down -v
	sudo rm -rf keys
	sudo rm -rf vault
