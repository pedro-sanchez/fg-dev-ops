#!/bin/bash

sudo apt-get upgrade -y;

sudo apt-get update -y;

sh office.sh;

sh chrome.sh;

sh install_java.sh;

sh install_mvn.sh;

sh install_git.sh;

sh install_postgres.sh 9.3;
