#!/bin/bash
sudo apt install git -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo git clone https://github.com/profsam97/eyefront.git
node -v
npm -v
cd eyefront
npm install
npm run build 