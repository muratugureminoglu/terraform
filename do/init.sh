#!/bin/bash

community_version="https://api.github.com/repos/ant-media/Ant-Media-Server/releases/latest | grep \"browser_download_url\" | awk '{ print $2 }' | sed 's/,$//' | sed 's/\"//g'"
enterprise_version=""

wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh && chmod 755 install_ant-media-server.sh

if [ "$marketplace" = "enterprise" ]; then
	wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate '[https://docs.google.com/uc?export=download&id=1avVXMd5S6NNUu6Lj-k-ZvIqb57-0q-Nf](https://docs.google.com/uc?export=download&id=1ZLJ87NSIXCluNPfS-lzggZTI6fcUHkkR)' -O- | sed -rn 's/.*confirm=(\[0-9A-Za-z_\]+).*/\\1\\n/p')&id=1avVXMd5S6NNUu6Lj-k-ZvIqb57-0q-Nf" -O ant.zip && rm -rf /tmp/cookies.txt
	./install_ant-media-server.sh -i ant.zip
else
	curl -L -o ant.zip $(curl -s $community_version)
	./install_ant-media-server.sh -i ant.zip
fi
sudo apt-get purge droplet-agent -y
sed -i 's/server.marketplace=.*/server.marketplace=do/g' /usr/local/antmedia/conf/red5.properties
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 443/tcp
sudo ufw allow 80/tcp
sudo ufw allow 5080/tcp
sudo ufw allow 1935/tcp
sudo ufw allow 5443/tcp
sudo ufw allow 50000:65000/udp
sudo ufw allow 4200/udp
echo "y" | sudo ufw enable
systemctl stop antmedia
rm -rf /root/.ssh
rm -rf /usr/local/antmedia/conf/instanceId
rm -rf /usr/local/antmedia/*.db.*
rm -rf /usr/local/antmedia/*.db
rm -rf /root/*.zip && rm -rf /root/install*
sudo apt-get purge droplet-agent -y

wget https://raw.githubusercontent.com/digitalocean/marketplace-partners/master/scripts/90-cleanup.sh
wget https://raw.githubusercontent.com/digitalocean/marketplace-partners/master/scripts/99-img-check.sh

bash 90-cleanup.sh
bash 99-img-check.sh
history -c
shutdown -h now