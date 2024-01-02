#!/bin/sh
# https://docs.docker.com/engine/install/debian/#install-using-the-repository
#
# Start!
#
sudo echo -n "Start: " > /root/STATUS
sudo date >> /root/STATUS

# Update the apt package index 
sudo apt update
# sudo apt upgrade -y

# Uninstall old versions
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt autoremove -y

# Install packages to allow apt to use a repository over HTTPS:
sudo apt install -y --no-install-recommends ca-certificates curl gnupg git

# Add Docker’s official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
sudo chmod a+x /usr/local/bin/repo

########## CREATE NON-ROOT USER ##########
sudo groupadd docker --gid 9000
sudo groupadd builder --gid 5740
sudo adduser --shell /bin/bash --gecos "Embedded Builder Profile" --uid 5740 --gid 5740 --disabled-password builder
sudo usermod -aG docker builder
sudo echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder
sudo chmod 0440 /etc/sudoers.d/builder

########## NON-ROOT USER SETUP ##########
sudo -u builder -H echo "[user]
	email = usuario@email.com.br
	name = Usuario do Git
[init]
	defaultBranch = master
[alias]
	hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
[color]
	ui = auto
" > /home/builder/.gitconfig

# Download container repository
sudo -u builder -H git clone https://github.com/varigit/var-host-docker-containers.git /home/builder/var-host-docker-containers

# Initialize repo and download Yocto sources
sudo -u builder -- sh -c "mkdir -p /home/builder/docker-yocto-build ; \
	cd /home/builder/docker-yocto-build ; \
	repo init -u https://github.com/varigit/variscite-bsp-platform.git -b dunfell -m default.xml ; \
	repo sync -j$(nproc) "

# Update the apt package index.
sudo apt update
# Install Docker Engine, containerd, and Docker Compose.
# Debian 10
#sudo apt install -y --no-install-recommends sudo docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin qemu-user-static htop neofetch ncdu
# Debian 11
sudo apt install -y --no-install-recommends python-is-python3 sudo docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin qemu-user-static htop neofetch ncdu

sudo echo -n "End: " >> /root/STATUS
sudo date >> /root/STATUS
sudo echo "Show-me the code!" >> /root/STATUS
