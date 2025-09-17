include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/_modules/aks"
}

dependency "dns" {
  config_path ="../dns"
  mock_outputs={
    id=""
  }
  mock_outputs_merge_with_state=true
}

dependency "resource_group" {
  config_path ="../resource_group/"
  mock_outputs={
    name=""
  }
  mock_outputs_merge_with_state=true
}

inputs = {
  # location=include.root.locals.location
  resource_group_name=dependency.resource_group.outputs.name
  cluster_name = "argo"
  dns_zone_id = dependency.dns.outputs.id
}
