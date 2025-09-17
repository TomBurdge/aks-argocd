include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/_modules/dns"
}

dependency "resource_group" {
  config_path ="../resource_group/"
  mock_outputs={
    name=""
  }
  mock_outputs_merge_with_state=true
}

inputs = {
  resource_group_name=dependency.resource_group.outputs.name
  name = "guestbook.argocdapp.example.com"
}
