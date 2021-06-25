provider "helm" {
  kubernetes {
    config_path = "./kubeconfig.yaml"
  }
}

data "ionoscloud_k8s_cluster" "yb1" {
  id = "${ionoscloud_k8s_cluster.yb1.id}"
}

resource "null_resource" "getcfg" {
  provisioner "local-exec" {
    command = <<EOT
      curl --include \
     --request GET \
     --user "var.username:var.password" \
     https://api.ionos.com/cloudapi/v6/k8s/${ionoscloud_k8s_cluster.yb1.id}/kubeconfig > kubeconfig.yaml
 EOT
  }
}

resource "helm_release" "ingress-nginx" {
  repository       = "https://kubernetes.github.io/ingress-nginx"
  name             = "ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
}
