#!/usr/bin/env bash

setupEnvrionment () {
  printf '===========================Setup the environment============================== \n'

  cd ..
  sudo apt-get update
  sudo apt-get install -y postgresql
  sudo apt-get install -y postgresql-client
  sudo apt-get install -y postgresql-contrib
}

addPostgresUser () {
  printf '===========================Setup the environment============================== \n'
  sudo -u postgres psql -c "CREATE USER replica REPLICATION LOGIN ENCRYPTED PASSWORD 'lmsreplica';"
}

editPostgresConf () {
  printf '===========================Edit Postgres Conf file============================== \n'
  sudo rm -rf /etc/postgresql/9.4/main/postgresql.conf
}

run () {
  setupEnvrionment
  addPostgresUser
  editPostgresConf
}

run