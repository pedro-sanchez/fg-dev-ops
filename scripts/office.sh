#!/bin/bash

#if [ $# -le 0 ]; then
#   echo "Informe a url do office";
#    exit;
#fi

#URL=$1;

sudo apt-get autoremove libreoffice* -y ;

sudo apt-get remove --purge libreoffice-* -y;

wget http://kdl.cc.ksosoft.com/wps-community/download/a16/wps-office_9.1.0.4945~a16p3_i386.deb -O office.deb;

sudo dpkg -i office.deb;

sudo rm office.deb;

echo 'FIM install office...';



