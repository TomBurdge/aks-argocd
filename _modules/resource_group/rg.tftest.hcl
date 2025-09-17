run "random_str" {
  module {
    source = "../random"
  }
}

run "create_rg" {
  command = apply   
  variables {
    name=upper("TEST-${run.random_str.random_string}-RG")
  }
  assert {
    condition = azurerm_resource_group.this.name == upper("TEST-${run.setup_tests.random_string}-RG")
    error_message = "Resource group name did not match."
  }
}
