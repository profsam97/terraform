#!/bin/bash
sudo apt install git nodejs -y
sudo git clone https://github.com/profsam97/eyefront.git
node -v
npm -v
cd eyefront
npm install
npm run build 