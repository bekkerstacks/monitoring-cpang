FROM prom/node-exporter:v0.18.0
# thanks: https://github.com/stefanprodan/swarmprom

ENV NODE_ID=none
USER root
COPY conf /etc/node-exporter/

ENTRYPOINT  [ "/etc/node-exporter/docker-entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]
