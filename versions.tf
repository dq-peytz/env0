terraform {
  required_version = ">= 0.13"
  required_providers {
    k8s = {
      source  = "banzaicloud/k8s"
      version = "0.9.1"
    }
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "6.0.0-alpha.3"
    }
  }
}
