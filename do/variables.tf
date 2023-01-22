variable "do_token" {
  type = string
  default = "dop_v1_c25852469875173225f8813a02ae990e5921c4f4fbe2d82dcb9e938de562e349"
}

variable "do_cluster_enable" {
  default = false
}

variable "do_cluster_name" {
  default = "antmedia"
}

variable "do_region" {
  default = "fra1"
}

variable "do_kubernetes_version" {
  default = "1.25.4-do.0"
}

variable "do_node_name" {
  default = "ams-pool"
}

variable "do_autoscale" {
  default = true
}

variable "do_min_nodes" {
  default = "3"
}

variable "do_max_nodes" {
  default = "10"
}

variable "kubeconfig_path" {
  default     = "./kubeconfig"
}
