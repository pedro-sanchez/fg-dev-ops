#!/bin/bash
echo 'install maven';
sudo apt-get install maven -y;

echo "" >> ~/.profile ;

#MVN_DIR="$(find /opt/ -maxdepth 1 -iname '*'"maven"'*')";

echo "M2_HOME=/usr/share/maven" >> ~/.profile ;
echo 'export PATH=$PATH:$M2_HOME/bin' >> ~/.profile ;

echo 'Fim install maven';
