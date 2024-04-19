#!/bin/bash
sudo apt install git -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20
sudo git clone https://github.com/profsam97/eyefront.git
sudo cd eyefront
npm install
npm run build 