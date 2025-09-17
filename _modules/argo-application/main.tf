resource "kubernetes_manifest" "application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = var.app_name
      namespace = var.app_namespace
      # Means: delete everything in the app if the app is deleted
      finalizers = ["resources-finalizer.argocd.argoproj.io"]
    }
    spec = {
      project = "default"

      source = {
        repoURL        = var.repo_url
        targetRevision = var.target_revision
        path           = var.path
        helm = {
          valueFiles = var.helm_value_files
        }
      }

      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = var.destination_ns
      }

      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = [
          "CreateNamespace=true",
          "PrunePropagationPolicy=foreground",
          "PruneLast=true",
        ]
      }
    }
  }
}
