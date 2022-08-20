# Chaos Load Testing
## Setup
* install k6
```bash
brew install k6
```
* install chaostoolkit-k6
```bash
pip3 install -U chaostoolkit-k6
```

## Run Experiments
* Run experiment using k6
```bash
k6 run --out csv=output.csv experiments/load_test/k6_scripts/simple.js
```
* Run experiment using chaostoolkit
```bash
chaos run experiments/load_test/stress_service.yaml
```

## Resources
* [k6 documentation](https://k6.io/docs/)
* [chaostoolkit-k6 documentation](https://chaostoolkit.org/drivers/k6/)
