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
- requires md5sum hash for username/password as `MD5SUM` for UI auth, defaults to admin/admin

```
$ wget -O docker-compose.traefik.yml https://raw.githubusercontent.com/bekkerstacks/traefik/master/docker-compose.yml
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

a Stack without Treafik:

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
