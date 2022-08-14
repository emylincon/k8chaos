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
* activate virtual environment
```
source venv/bin/activate
```
* install dependencies
```bash
pip3 install -r requirements.txt
```
* Run experiment
```bash
chaos run experiments/terminate_pod.yaml
```

# Resources
* [EKSCTK](https://eksctl.io)
* [ChaosToolKit Documentation](https://chaostoolkit.org/reference/usage/cli/)
* [linkedin learning chaos engineering course](https://www.linkedin.com/learning/devops-foundations-chaos-engineering/organized-chaos?autoplay=true&u=2146476)
* [Chaos Tookkit Getting started Youtube video](https://www.youtube.com/watch?v=XZ_1ZqyOCdE&t=946s)
