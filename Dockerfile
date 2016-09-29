FROM datadog/docker-dd-agent:latest-alpine
ADD haproxy.yaml /etc/dd-agent/conf.d/haproxy.yaml
