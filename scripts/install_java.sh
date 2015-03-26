#!/bin/bash

if [ $# -le 0 ]; then
    echo "Informe a versão do java. ex. 7";
    exit;
fi

VERSAO_JAVA=$1;

echo 'removing openjdk...';
sudo apt-get remove --purge openjdk-* -y;

echo 'install JAVA...';
sudo apt-get -y install python-software-properties;
sudo add-apt-repository -y ppa:webupd8team/java;
sudo apt-get update;
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections;
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections;
sudo apt-get -y install oracle-java$VERSAO_JAVA-installer;


echo "" >> ~/.profile ;

JDK_NAME="$(ls /usr/lib/jvm)";

echo "JAVA_HOME=/usr/lib/jvm/$JDK_NAME" >> ~/.profile ;
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.profile ;
echo "export JAVA_HOME" >> ~/.profile ;


if [ -d "/usr/lib/jvm/$JDK_NAME/jre/lib/amd64" ]; then

	cd /usr/lib/mozilla/plugins; 
	sudo ln -s /usr/lib/jvm/$JDK_NAME/jre/lib/amd64/libnpjp2.so; 

	cd /opt/google/chrome;
	sudo mkdir plugins;
	cd plugins;
	sudo ln -s /usr/lib/jvm/$JDK_NAME/jre/lib/amd64/libnpjp2.so /opt/google/chrome/plugins/ 
fi

if [ -d "/usr/lib/jvm/$JDK_NAME/jre/lib/i386" ]; then
	cd /usr/lib/mozilla/plugins; 
	sudo ln -s /usr/lib/jvm/$JDK_NAME/jre/lib/i386/libnpjp2.so; 

	cd /opt/google/chrome;
	sudo mkdir plugins;
	cd plugins;
	sudo ln -s /usr/lib/jvm/$JDK_NAME/jre/lib/i386/libnpjp2.so /opt/google/chrome/plugins/ 
fi

echo 'FIM install JAVA...';
