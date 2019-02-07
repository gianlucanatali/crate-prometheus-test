# crate-prometheus-test
Testing set for CrateDB prometheus integration

## Create network to use host
docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernet


##Build and run
docker build -t my-prometheus .
docker run -p 9090:9090 my-prometheus --net=dockernet

Docs from https://prometheus.io/docs/prometheus/latest/installation/


## Follow getting started
https://prometheus.io/docs/prometheus/latest/getting_started/

## run crateDB
docker run -d -p 4203:4200 -p 4300:4300 -p 5436:5432 crate:3.2 crate --net=dockernet

## create table
CREATE TABLE prometheus."metrics" (
    "timestamp" TIMESTAMP,
    "labels_hash" STRING,
    "labels" OBJECT(DYNAMIC),
    "value" DOUBLE,
    "valueRaw" LONG,
    "day__generated" TIMESTAMP GENERATED ALWAYS AS date_trunc('day', "timestamp"),
    PRIMARY KEY ("timestamp", "labels_hash", "day__generated")
  ) PARTITIONED BY ("day__generated");


