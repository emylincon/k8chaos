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
chaos run experiments/terminate_pod.yaml  --rollback-strategy deviated
```

# Experiment solutions
* `terminate_pod.yaml`: number of replicas should be at least 2
* `delete_deployment.yaml`: Use a suitable GitOps strategy
* `scale_deployment.yaml`: Use a suitable GitOps strategy
* `delete_node.yaml`: Use an autoscaling group
* `drain_node.yaml`: Use a suitable GitOps strategy & autoscaling group
* `delete_replica.yaml`: Use kubernetes deployments
* `delete_service.yaml`: Use a suitable GitOps strategy & DNS configuration

## Helper script
* `ensure_deployment.sh` script is a helper script that ensure the deployment is always up & replica count matches manifest
* This script is an overly simplified emulation of what `GitOps` tools like [`Argo CD`](https://github.com/argoproj/argo-cd) does.
```bash
./ensure_deployment.sh
```

# Resources
* [EKSCTK](https://eksctl.io)
* [ChaosToolKit Documentation](https://chaostoolkit.org/reference/usage/cli/)
* [linkedin learning chaos engineering course](https://www.linkedin.com/learning/devops-foundations-chaos-engineering/organized-chaos?autoplay=true&u=2146476)
* [Chaos Tookkit Getting started Youtube video](https://www.youtube.com/watch?v=XZ_1ZqyOCdE&t=946s)
