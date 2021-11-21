CONF_PATH=srcs/docker-compose.yml
ENV_FILE=srcs/.env
USER=hheimerd
DATA_PATH=/home/${USER}/data

all:
	mkdir -p ${DATA_PATH}/wordpress_data
	mkdir -p ${DATA_PATH}/node-app
	chown -R ${USER}:${USER} ${DATA_PATH}
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} build
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} up

clean:
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} down
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} down -v

fclean: clean
	rm -rf ${DATA_PATH}/wordpress_data

re: fclean all