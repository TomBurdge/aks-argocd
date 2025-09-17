output "kube_admin_host" {
  value     = azurerm_kubernetes_cluster.this.kube_admin_config[0].host
  sensitive = true
}
output "kube_admin_cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.this.kube_admin_config[0].cluster_ca_certificate
  sensitive = true
}
output "kube_admin_client_certificate" {
  value     = azurerm_kubernetes_cluster.this.kube_admin_config[0].client_certificate
  sensitive = true
}
output "kube_admin_client_key" {
  value     = azurerm_kubernetes_cluster.this.kube_admin_config[0].client_key
  sensitive = true
}

output "id" {
  value = azurerm_kubernetes_cluster.this.id
}
