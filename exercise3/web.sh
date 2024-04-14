#!/bin/bash
yum install https wget unzip -y
systemctl start https
systemctl enable https
wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip
unzip -o 2133_moso_interior.zip
cp -r 2133_moso_interior/* /var/www/html
systemctl restart https