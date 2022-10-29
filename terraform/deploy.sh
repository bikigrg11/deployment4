#!/bin/bash

sudo apt update 
sudo apt -y install git
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sleep 3

git clone https://github.com/bikigrg11/deployment4.git
sleep 2
cd deployment4/
docker-compose up --build

