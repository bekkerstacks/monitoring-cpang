# monitoring-cpang 

cAdvisor, Prometheus, Alertmanager, Node-Exporter, Grafana

## How to use this

**Note**: Dependent service [Traefik](https://github.com/bekkerstacks/traefik#usage) is required, if you don't use traefik, you can find a [deploy without traefik](#alternative-versions)

Get the sources:

```
$ git clone https://github.com/bekkerstacks/monitoring-cpang
$ cd monitoring-cpang
```

#### Dependency: Traefik

Get Traefik, by default it uses SSL

See all [configuration options here](https://github.com/bekkerstacks/traefik#configuration):

- requires your domain name as env var `DOMAIN=""` defaults to `localhost`

```
$ wget -O docker-compose.traefik.yml https://raw.githubusercontent.com/bekkerstacks/traefik/master/docker-compose.yml
```

#### Authentication

Services that do not come with authentication endpoints, is protected by basic auth and by default is (`admin/admin`). 

To override:

```
$ htpasswd -c htpasswd <username>
```

#### Deploy Traefik and CPANG

This will deploy Traefik and a Fresh CPANG stack: 

```
$ export DOMAIN="localhost" # services will use traefik.localhost in this case
$ docker stack deploy -c docker-compose.traefik.yml proxy
$ docker stack deploy -c docker-compose.yml mon
```

### Alternative Versions:

a Stack with HTTP Endpoints:

```
# traefik needs to be running
$ docker stack deploy -c alt_versions/docker-compose_http.yml http_mon
```

a Stack without Traefik:

```
$ docker stack deploy -c alt_versions/docker-compose_no_traefik.yml notraefik_mon
```

If you want a stack with prepopulated dashboards::

```
# traefik needs to be running
$ docker stack deploy -c alt_versions/docker-compose_with_dashboards.yml dash_mon
```

CPANG Stack with MySQL, MySQL Exporter and Dashboards:

```
# traefik needs to be running
$ docker stack deploy -c alt_versions/docker-compose_http_with_dbs.yml dbs_mon
```

## Endpoints:

- Grafana: `grafana.${DOMAIN}`
- Alertmanager: `alertmanager.${DOMAIN}`
- Prometheus: `prometheus.${DOMAIN}`
- Traefik: `traefik.${DOMAIN}`

## Configuration

Look at the [wiki](https://github.com/bekkerstacks/monitoring-cpang/wiki) for tutorials on how to add datasources and dashboards

## Extra Dashboard Links:

Traefik:

- [4475 - Traefik per Backend](https://grafana.com/dashboards/4475)
- [6293 - Traefik Real Time](https://grafana.com/dashboards/6293)

Docker:

- [609 - Docker Swarm and Container Overview](https://grafana.com/dashboards/609)
