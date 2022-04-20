FROM golang:alpine AS builder
WORKDIR /app/
COPY ./infra-operator-tpl/infra-repo/ .
RUN go build -v -o infra-repo .
COPY ./th2-net.github.io/infra-operator-tpl-* ./th2-net.github.io/index.yaml /app/charts/
COPY grafana-plugins.txt download-plugins.sh .
RUN ./download-plugins.sh

FROM alpine:3.13
COPY --from=builder /app /app/
COPY ./dashboards /app/charts/dashboards
ENTRYPOINT ["/app/infra-repo", "-port=8080", "-path=/app/charts"]
