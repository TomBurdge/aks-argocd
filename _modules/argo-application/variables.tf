variable "app_name" { type = string }
variable "app_namespace" { type = string }
variable "repo_url" { type = string }
variable "target_revision" {
  type    = string
  default = "HEAD"
}
variable "path" { type = string }
variable "destination_ns" { type = string }
variable "helm_value_files" {
  type    = list(string)
  default = []
}
