FROM golang:alpine AS builder
WORKDIR /app/
COPY . .
RUN mkdir /app/charts && \
    go build -v -o infra-repo .

FROM alpine:3.13
COPY --from=builder /app /app/
# COPY infra-operator-tpl-0.3.0.tgz index.yaml /app/charts/
ENTRYPOINT ["/app/infra-repo", "-port=8080", "-path=/app/charts"]
