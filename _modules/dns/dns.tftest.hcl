run "random_str" {
  module {
    source = "../random"
  }
}

run "setup_rg" {
  module {
    source = "../resource_group"
  }
  variables {
    name=upper("TEST-${run.random_str.random_string}-RG")
  }
}
run "create_dns" {
  command = apply   
  variables {
    name="testdns.example.com"
    resource_group_name = run.setup_rg.name
  }
  assert {
    condition = azurerm_dns_zone.public.name == "testdns.example.com"
    error_message = "Resource group name did not match."
  }
}

