include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/_modules/helm_release"
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

dependency "resource_group" {
  config_path ="../resource_group/"
  mock_outputs={
    name=""
  }
  mock_outputs_merge_with_state=true
}

inputs = {
  name = "kube-prometheus-stack"
  chart = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart_version =     "77.6.2"
  namespace   = "monitoring"
}
