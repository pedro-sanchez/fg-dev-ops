#!/bin/bash

if [ $# -le 0 ]; then
    echo "Informe a versão do PostGres. ex. 9.3";
    exit;
fi

VERSAO_POSTGRES=$1;

echo 'install Postgres';
sudo apt-get install postgresql-$VERSAO_POSTGRES -y;

sudo -u postgres psql postgres -c "ALTER user postgres WITH PASSWORD 'postgres';";

sudo apt-get install pgadmin3 -y;

echo 'Fim install Postgres'
