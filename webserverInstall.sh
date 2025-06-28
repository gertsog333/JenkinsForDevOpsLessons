#!/bin/bash 

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
sleep 10
