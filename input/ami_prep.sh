#!/bin/bash

# installation
sudo yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
sudo yum update -y
sudo yum install mysql-community-client python3 python3-pip -y
sudo pip3 install flask
# the mysql.connector package listed in requirements.txt is no longer available
sudo pip3 install mysql-connector-python

# create systemd service
cat >/etc/systemd/system/crossover.service <<EOL
[Unit]
Description=Python Webserver for Crossover
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=root
ExecStart=/usr/bin/python3 /home/ec2-user/app/index.py

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload
systemctl enable crossover
systelctl start crossover
