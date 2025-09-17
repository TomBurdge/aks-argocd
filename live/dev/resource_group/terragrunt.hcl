include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/_modules/resource_group"
}


inputs = {
  # location=include.root.locals.location
  name="ARGO-CLUSTER-RG"
}
