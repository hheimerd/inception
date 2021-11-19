CONF_PATH=srcs/docker-compose.yml

all:
	docker-compose -f ${CONF_PATH} up