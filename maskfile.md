# Command Line Runner
## local-cluster
```bash
kind create cluster --config=multi-node-kind-cluster.yaml
```
## open-hosts
```bash
explorer.exe 'C:\Windows\System32\drivers\etc'
```
## get-argocd-login
Get the Argo CD initial admin password
```bash
kubectl get secret argocd-initial-admin-secret -n argocd \
  -o jsonpath="{.data.password}" | base64 -d; echo

```
## port-forward-argocd
```bash
echo 'Open at http://localhost:8080/'
kubectl port-forward svc/argocd-server -n argocd 8080:80
```
## get-prometheus-login
```bash

```
## port-forward-prometheus
```bash
echo 'Open at http://localhost:3000'
kubectl port-forward svc/kube-prometheus-stack-grafana -n monitoring 3000:80
```
