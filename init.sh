sudo fallocate -l 3G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
free -h 

sudo iptables-save > iptables.backup
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo systemctl stop iptables
sudo systemctl disable iptables
sudo iptables -L
sudo iptables -F


sudo apt update
sudo apt install wget nano net-tools nginx -y

mkdir ~/miniforge
cd ~/miniforge

# curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
wget -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b
# wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
# mkdir -p "${HOME}/conda"
# bash Miniforge3.sh -b -p "${HOME}/conda"
source "${HOME}/miniforge3/etc/profile.d/conda.sh"
conda activate
conda create -n flask-env python=3.13 -y
conda activate flask-env
conda install flask gunicorn -y
conda create -n fastapi-env python=3.13 -y
conda activate fastapi-env
conda install fastapi gunicorn uvicorn[standard] -y
conda activate
