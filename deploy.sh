MODE=${BSTACKS_MODE-:https}
FEATURE=${BSTACKS_FEATURE:-default}

if [ $BSTACKS_MODE == "http" ] && [ $BSTACKS_FEATURE == "dashboards" ]
  then
    echo "deploying monitoring stack in http mode with dashboards pre-configured"
    docker stack deploy -c alt_versions/docker-compose_http_with_dashboards.yml mon
    echo "Stack is available at:"
    echo "- http:/grafana.${DOMAIN}"
    echo "- http:/grafana.${DOMAIN}"
    echo "- http:/grafana.${DOMAIN}"
  else
    echo "deploying monitoring stack in https mode"
    docker stack deploy -c docker-compose.yml mon
fi
