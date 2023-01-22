resource "digitalocean_kubernetes_cluster" "ams" {
  count = var.do_cluster_enable ? 1 : 0
  name   = var.do_cluster_name
  region = var.do_region
  version = var.do_kubernetes_version

  node_pool {
    name       = var.do_node_name
    size       = "s-2vcpu-2gb"
    auto_scale = var.do_autoscale
    min_nodes  = var.do_min_nodes
    max_nodes  = var.do_max_nodes
  }
}

