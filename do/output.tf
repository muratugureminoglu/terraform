#output "kubernetes_host" {
#  description = "The hostname of the API server for the cluster"
#  value       = digitalocean_kubernetes_cluster.ams[count.index].endpoint
#}

#output "ip_address_enterprise" {
#  value = digitalocean_droplet.enterprise[count.index].ipv4_address
#  description = "The public IP address of your Droplet application."
#}

#output "ip_address_community" {
#  value = digitalocean_droplet.community[count.index].ipv4_address
#  description = "The public IP address of your Droplet application."
#}