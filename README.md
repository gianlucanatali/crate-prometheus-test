# Test CrateDB prometheus adapter
Testing set for CrateDB prometheus integration. This docker-compose file will spin off all the components needed to test the correct functionality of the prometheus adapter.

## Components
There are 4 componets in the docker-compose:
- crate: is the cratedb instance
- crate-add-table: creates the table needed to store the information sent from prometheus
- crate-prometheus-adapter: the  [crate-adapter for Prometheus](https://github.com/crate/crate_adapter) configured to push the data to the crate instance defined in the compose file
- my-prometheus: a prometheus instance, simply configured following [Getting Started tutorial](https://prometheus.io/docs/prometheus/latest/getting_started). It also include the configuration needed for the [crate-adapter for Prometheus](https://github.com/crate/crate_adapter)

## How to run
docker-compose up
