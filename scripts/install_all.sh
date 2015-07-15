#!/bin/bash

######## Remove aplicativos
sh purge.sh;
########


######## Atualiza sistema
sudo apt-get update -y;
sudo apt-get upgrade -y;
sudo apt-get dist-upgrade -y;
sudo apt-get autoremove -y -f;
sudo apt-get autoclean -y;
########

sh office.sh;

sh chrome.sh;

sh install_java.sh;

sh install_mvn.sh;

sh install_git.sh;

sh install_postgres.sh 9.3;

####### Limpa sistema
sudo apt-get autoremove -y -f;
sudo apt-get autoclean -y;
#######


