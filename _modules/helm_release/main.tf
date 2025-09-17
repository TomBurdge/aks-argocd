resource "helm_release" "this" {
  chart      = var.chart
  name       = var.name
  repository = var.repository
  version    = var.chart_version
  namespace  = var.namespace

  create_namespace = true
  atomic           = true
}
