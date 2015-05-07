#!/bin/bash

echo 'install chrome';

sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main";
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -;

sudo apt-get update;

sudo aptitude install google-chrome-stable -y;

echo 'Fim install chrome'
