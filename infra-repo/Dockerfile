FROM golang:alpine AS builder
WORKDIR /app/
COPY . .
RUN mkdir /app/charts && \
    go build -v -o infra-repo .
COPY ./infra-operator-tpl-* ./index.yaml /app/charts/

FROM alpine:3.13
COPY --from=builder /app /app/
ENTRYPOINT ["/app/infra-repo", "-port=8080", "-path=/app/charts"]
