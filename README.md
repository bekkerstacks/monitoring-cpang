# monitoring-cpang (wip)
cAdvisor, Prometheus, Alertmanager, Node-Exporter, Grafana

## How to use this

Note: Dependent service [Traefik](https://github.com/bekkerstacks/traefik#usage)

```
$ git clone https://github.com/bekkerstacks/monitoring-cpang
$ cd monitoring cpang
```

This will deploy a Fresh CPANG stack: 

```
$ docker stack deploy -c docker-compose.yml mon
```

### Pre-Populate Dashboards:

This will deploy a CPANG Stack with Dashboards, requires MySQL for the MySQL-Exporter:

```
$ docker stack deploy -c docker-compose.with_dashboards.yml mon
$ docker stack deploy -c docker-compose.mysql.yml dbs
```


