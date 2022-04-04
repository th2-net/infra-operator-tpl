FROM golang:alpine AS builder
WORKDIR /app/
COPY ./infra-operator-tpl/infra-repo/ .
RUN go build -v -o infra-repo .
COPY ./th2-net.github.io/infra-operator-tpl-* ./th2-net.github.io/index.yaml /app/charts/
COPY ./th2-net.github.io/th2-infra/dashboards/grafana-dashboards /app/charts/
RUN mkdir -p /app/chart/grafana-plugins/
ADD https://grafana.com/api/plugins/flant-statusmap-panel /app/chart/grafana-plugins/

FROM alpine:3.13
COPY --from=builder /app /app/
ENTRYPOINT ["/app/infra-repo", "-port=8080", "-path=/app/charts"]
