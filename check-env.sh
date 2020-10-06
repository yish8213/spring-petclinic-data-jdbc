#!/usr/bin/env bash
set -ex

RETRY_COUNT=10

function test_mysql {
    echo "Checking MySQL server(127.0.0.1)"
    mysqladmin -uroot -ppetclinic -h127.0.0.1 ping --connect_timeout=2
}

count=0
until ( test_mysql )
do
  count=$((count+1))
  if [ ${count} -gt ${RETRY_COUNT} ]
  then
    echo "Failed to start required services."
    exit 1
  fi
  echo "Checking the services(retry = ${count})"
  sleep 10
done
