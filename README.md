# terraform

# DO

## To create Kubernetes Cluster
`terraform apply --var "do_cluster_enable=true"`

## To create Marketplace Images (Enterprise/Community)    
`terraform apply --auto-approve`

## To destroy all infrastructure
`terraform apply -destroy --auto-approve`
