#!/usr/bin/env bash

addPostgresConf () {
  printf '===========================Copy Postgres Conf file============================== \n'
  sudo mkdir -p /var/lib/9.5/main/archive/
  cd /home/ubuntu
  ls -la
  sudo mv postgresql.conf /etc/postgresql/9.5/main/postgresql.conf
}

editHbaConf () {
  printf '===========================Edit pg_hba Conf file============================== \n'
  cd
  pwd
  sudo bash -c 'echo "host    replication     replica      all                        md5" >> /etc/postgresql/9.5/main/pg_hba.conf'
  sudo cat /etc/postgresql/9.5/main/pg_hba.conf
}

run () {
  addPostgresConf
  editHbaConf
}

run