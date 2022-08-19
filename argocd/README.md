# ARGOCD SetUp
## Install argocd to cluster
* Apply manifest
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
* Expose service
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
* The login username is `admin`. To get login password, run following command:
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## Deploy app using argocd
* Deploy app using the `nginx_app.yaml` manifest file
```bash
kubectl apply -n argocd -f nginx_app.yaml
```

## Resources
* [ArgoCd Getting Started](https://argo-cd.readthedocs.io/en/stable/getting_started/)
* [ArgoCD Apps Example](https://github.com/argoproj/argocd-example-apps)
* [Youtube Example](https://www.youtube.com/watch?v=2WSJF7d8dUg&ab_channel=ThatDevOpsGuy)
