output "datacenter_id" {
   description = "Data Center ID."
   value = "${ionoscloud_datacenter.g12.id}"
}   

output "ionoscloud_k8s_cluster_id" {
   description = "Data Center ID."
   value = "${ionoscloud_k8s_cluster.yb1.id}"
}
