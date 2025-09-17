# This could go at the start of a workflow

az extension add -n k8s-configuration
az extension add -n k8s-extension

az provider register --namespace Microsoft.Kubernetes
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.KubernetesConfiguration
az provider register --namespace Microsoft.Monitor
az provider register --namespace Microsoft.Dashboard
az provider register --namespace Microsoft.AlertsManagement
