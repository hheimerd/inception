CONF_PATH=srcs/docker-compose.yml
ENV_FILE=srcs/.env
all:
	mkdir -p /home/hheimerd/data/wordpress_data
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} build
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} up

clean:
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} down
	docker-compose -f ${CONF_PATH} --env-file ${ENV_FILE} down -v

fclean: clean
	rm -rf /home/hheimerd/data/wordpress_data

re: fclean all