include "root" {
  path = find_in_parent_folders("root.hcl")
  expose=true
}

terraform {
  source = "${get_repo_root()}/_modules/managed_prometheus"
}

dependency "aks" {
  config_path = "../aks"

  mock_outputs = {
    kube_admin_host                   = "https://example.invalid"
    kube_admin_cluster_ca_certificate = ""
    kube_admin_client_certificate     = ""
    kube_admin_client_key             = ""
    id = ""
  }
  mock_outputs_merge_with_state = true
}

dependency "resource_group" {
  config_path ="../resource_group/"
  mock_outputs={
    name=""
    id=""
  }
  mock_outputs_merge_with_state=true
}

inputs = {
  location = include.root.locals.location
  aks_id = dependency.aks.outputs.id
  resource_group_name=dependency.resource_group.outputs.name
  resource_group_id=dependency.resource_group.outputs.id
}
