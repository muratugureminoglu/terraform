resource "local_file" "kubeconfig" {
  count = var.do_cluster_enable ? 1 : 0
  content  = digitalocean_kubernetes_cluster.ams[count.index].kube_config[0].raw_config
#  filename = pathexpand(var.kubeconfig_path)
  filename     = "./kubeconfig"
  file_permission = "644"
}