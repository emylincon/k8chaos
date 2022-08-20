# Chaos in AWS Cloud
## Setup
* change directory to the [`terraform`](./terraform)
* update values in the [`terraform/variables.tf`](./terraform/variables.tf) to match your aws environment
* apply terraform configuration
```bash
terraform apply
```
* copy the ec2 ip and replace the `front_url` variable in [`ec2_restart.yaml`](./ec2_restart.yaml)

## Run experiment
```bash
chaos run ec2_restart.yaml  --rollback-strategy deviated
```
