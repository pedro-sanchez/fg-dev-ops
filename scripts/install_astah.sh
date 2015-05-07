#!/bin/bash
echo 'install astah';
sudo apt-key adv --keyserver pgp.nic.ad.jp --recv-keys C22BD678;
sudo apt-get update;
sudo echo "deb http://members.change-vision.com/repos/apt/ astah main" >> /etc/apt/sources.list; 

sudo apt-get update;

sudo apt-get -y install astah-community ;

echo 'Fim install astah';
