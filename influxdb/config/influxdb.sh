#!/bin/bash
influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON grafana TO admin"