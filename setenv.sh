#source this file
export MONGO_INITDB_ROOT_USERNAME=admin
export MONGO_INITDB_ROOT_PASSWORD=<set password>
export MONGO_DB_PATH=/home/dmh2000/projects/mongo/data
export MONGO_DB_USERNAME=retro
export MONGO_DB_PASSWORD=<set password>
export MONGO_DB_DATABASE=retro
export MONGO_DB_CONTAINER_NAME=mongo_db
printenv | grep MONGO 
