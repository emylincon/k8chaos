# Chaos K8 experiment with chaos-toolkit
## Set Up
* create `EKS` cluster on aws
```bash
eksctl create cluster -f eks_cluster.yaml
```
* spin up test nginx deployment
```bash
kubectl apply -f nginx.yaml
```
## Experiment
* create virtual environment
```bash
python3 -m venv venv
```
* install dependencies
```bash
pip3 install -r requirements.txt
```
* Run experiment
```bash
chaos run experiment.json
```

# Resources
* [EKSCTK](https://eksctl.io)
* [ChaosToolKit usage](https://chaostoolkit.org/reference/usage/cli/)
