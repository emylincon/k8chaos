# WireMock Server manifest
Mock server used for testing chaos in network

## Setup
* create namespace
```bash
kubectl apply -f namespace.yml
```
* create `app`, `configmap` and `service`
```bash
kubectl apply -f '*.yml'
```
* This will create a `loadbalancer service` in port 8080

## Exposed api Endpoints
The following are exposed endpoints from this configuration
* `/name`
* `/greet`
* `/items`
* `/error`
