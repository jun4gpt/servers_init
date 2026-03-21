apt update
apt install wget nano net-tools nginx -y

mkdir ~/miniforge
cd ~/miniforge

# curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b
# wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
# mkdir -p "${HOME}/conda"
# bash Miniforge3.sh -b -p "${HOME}/conda"
source "${HOME}/miniforge3/etc/profile.d/conda.sh"
conda activate
conda create -n flask-env python=3.13 -y
conda activate flask-env
conda install flask -y
conda create -n fastapi-env python=3.13 -y
conda activate fastapi-env
conda install fastapi -y
conda activate
