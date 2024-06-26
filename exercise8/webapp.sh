#!/bin/bash
sudo yum install git -y
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo -E bash -
sudo yum install -y nodejs
sudo git clone https://github.com/profsam97/Ryada.git
node -v
npm -v
cd Ryada
sudo npm install
sudo npm run build 
ifconfig | grep inet
sudo nohup npm start & # Run npm start in the background using nohup