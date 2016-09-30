# docker-dd-agent-haproxy

Enable monitoring of your HAproxy service within minutes.
 
This Datadog Docker agent comes with built-in HAproxy integration. The agent expects a container link named "haproxy". The HTTP stats page needs to be served at port 1936 with authentication "username:password".

# Example Docker Cloud Stackfile

```
datadog:
  environment:
    - API_KEY=MY_SECRET_DATADOG_KEY
  image: 'henkel/docker-dd-agent-haproxy:latest'
  links:
    - haproxy
  volumes:
    - '/var/run/docker.sock:/var/run/docker.sock:ro'
haproxy:
  environment:
    - 'STATS_AUTH="username:password"'
    - STATS_PORT=1936
  image: 'interaction/haproxy:master'
  links:
    - web
  ports:
    - '80:80'
    - '1936'
  roles:
    - global
web:
  image: 'dockercloud/hello-world:latest'
```
