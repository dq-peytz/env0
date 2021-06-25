resource "ionoscloud_k8s_cluster" "yb1" {
  name        = "r4d4"
  k8s_version = "1.18.5"
  maintenance_window {
    day_of_the_week = "Monday"
    time            = "09:30:00Z"
  }
  # Depends_on is required to tear down a cluster and datacenter in the proper order.
  # See https://registry.terraform.io/providers/ionos-cloud/ionoscloud/latest/docs/resources/k8s_cluster#important-notes
  depends_on = [
    ionoscloud_datacenter.g12
  ]
}

resource "ionoscloud_k8s_node_pool" "n9g9" {
  name        = "n9g9"
  k8s_version = "1.18.5"
  auto_scaling {
    min_node_count = 1
    max_node_count = 2
  }
 
  maintenance_window {
    day_of_the_week = "Sunday"
    time            = "10:30:00Z"
  }
  datacenter_id     = "${ionoscloud_datacenter.g12.id}"
  k8s_cluster_id    = "${ionoscloud_k8s_cluster.yb1.id}"
  cpu_family        = "INTEL_SKYLAKE"
  availability_zone = "AUTO"
  storage_type      = "SSD"
  node_count        = 2
  cores_count       = 2
  ram_size          = 2048
  storage_size      = 40
}
