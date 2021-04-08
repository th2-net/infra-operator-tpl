FROM golang:alpine AS builder
WORKDIR /app/
COPY . .
RUN mkdir /app/charts && \
    go build -v -o infra-repo .

FROM alpine:3.13
COPY --from=builder /app /app/
COPY ../../th2-net.github.io/infra-operator-tpl-* ../../th2-net.github.io/index.yaml /app/charts/
ENTRYPOINT ["/app/infra-repo", "-port=8080", "-path=/app/charts"]
