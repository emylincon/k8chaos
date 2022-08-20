# Network chaos using toxiproxy
## Setup
* Download toxiproxy
```bash
brew tap shopify/shopify
brew install toxiproxy
```
* start server
```bash
toxiproxy-server
```
* create proxy
```bash
toxiproxy-cli create -l localhost:20080 -u localhost:80 web_test_nginx
```

## Experiment
* run experiment
```bash
chaos run experiments/network/latency_delay.yaml --rollback-strategy deviated
```
