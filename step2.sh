#/bin/bash

# RUN THIS IN A SEPARATE SHELL
# this autmatically creates an admin user with root permissions
# see docker-compose.yml
# https://hub.docker.com/_/mongo
# 
echo ================================
echo START MONGODB AND CREATE ADMIN
echo ================================

# docker compose
docker-compose up --detach
