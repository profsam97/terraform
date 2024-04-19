#!/bin/bash
sudo apt install git -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo git clone https://github.com/profsam97/Ryada.git
node -v
npm -v
cd ryada
sudo npm install
sudo npm run build 
ifconfig | grep inet
sudo npm start