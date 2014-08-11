#!/bin/bash

sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs curl git
sudo npm install -g meteorite

if [ ! -d "reaction" ]; then
  git clone https://github.com/ongoworks/reaction.git
fi

cd reaction
mrt update

# Install meteor
curl --silent https://install.meteor.com | /bin/sh
sudo meteor update

cp /home/vagrant/reaction/bin/../settings/dev.sample.json /home/vagrant/reaction/bin/../settings/dev.json

# Remove force SSL
sudo meteor remove force-ssl

sudo ./bin/run
