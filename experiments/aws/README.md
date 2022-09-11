# Chaos in AWS Cloud
## Setup
* change directory to the [`terraform`](./terraform)
* update values in the [`terraform/variables.tf`](./terraform/variables.tf) to match your aws environment
* apply terraform configuration
```bash
terraform apply
```
* source ./config_env_vars.sh

## Run experiment
```bash
chaos run ec2_restart.yaml  --rollback-strategy deviated
```
