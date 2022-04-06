#!/bin/bash

mkdir -p /app/charts/grafana-plugins/

while read line; do
  curl (cd app/charts/grafana-plugins/ &&$line -O)
done < grafana-plugins.txt