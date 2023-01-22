resource "digitalocean_ssh_key" "default" {
  name       = "Terraform_Temp"
  public_key = file("./ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "enterprise" {
  image  = "ubuntu-20-04-x64"
  name   = "ams-server-enterprise"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

  provisioner "file" {
    source = "init.sh"
    destination = "/tmp/init.sh"
    
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("./ssh/id_rsa")
      host        = digitalocean_droplet.enterprise.ipv4_address
    }

  }


  provisioner "remote-exec" {
    inline = [
      "apt remove unattended-upgrades droplet-agent -y",
      "export marketplace=enterprise",
      "chmod +x /tmp/init.sh",
      "/tmp/init.sh",
    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("./ssh/id_rsa")
      host        = digitalocean_droplet.enterprise.ipv4_address
    }
  }
}

resource "digitalocean_droplet_snapshot" "ams-enterprise-snapshot" {
  droplet_id = digitalocean_droplet.enterprise.id
  name       = "ams-enterprise-snapshot-01"
}

resource "digitalocean_droplet" "community" {
  image  = "ubuntu-20-04-x64"
  name   = "ams-server-community"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

  provisioner "file" {
    source = "init.sh"
    destination = "/tmp/init.sh"
    
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("./ssh/id_rsa")
      host        = digitalocean_droplet.community.ipv4_address
    }

  }


  provisioner "remote-exec" {
    inline = [
      "apt remove unattended-upgrades droplet-agent -y",
      "chmod +x /tmp/init.sh",
      "/tmp/init.sh",
    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("./ssh/id_rsa")
      host        = digitalocean_droplet.community.ipv4_address
    }
  }
}

resource "digitalocean_droplet_snapshot" "ams-community-snapshot" {
  droplet_id = digitalocean_droplet.community.id
  name       = "ams-community-snapshot-01"
}
