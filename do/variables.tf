variable "do_token" {
  type = string
  default = "do_toke"
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
