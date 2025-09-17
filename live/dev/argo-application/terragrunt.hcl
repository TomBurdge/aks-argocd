include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/_modules/argo-application"
}

dependency "aks" {
  config_path = "../aks"

  mock_outputs = {
    kube_admin_host                   = "https://example.invalid"
    kube_admin_cluster_ca_certificate = ""
    kube_admin_client_certificate     = ""
    kube_admin_client_key             = ""
  }
  mock_outputs_merge_with_state = true
}

generate "kubernetes_provider" {
  path      = "provider-kubernetes.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<-EOF
    provider "kubernetes" {
      host                   = "${dependency.aks.outputs.kube_admin_host}"
      cluster_ca_certificate = base64decode("${dependency.aks.outputs.kube_admin_cluster_ca_certificate}")
      client_certificate     = base64decode("${dependency.aks.outputs.kube_admin_client_certificate}")
      client_key             = base64decode("${dependency.aks.outputs.kube_admin_client_key}")
    }
  EOF
}

inputs = {
  app_name        = "helm-guestbook"
  app_namespace   = "argocd"
  repo_url        = "https://github.com/TomBurdge/aks-argocd.git"
  target_revision = "HEAD"
  path            = "charts/guestbook"
  destination_ns  = "demo"
}
