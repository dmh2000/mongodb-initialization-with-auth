# SOURCE THIS FILE

# stop running instance, if any
docker-compose stop

# remove existing container
docker rm mongo_db

# clear all relevant environment variables
source clrenv.sh

# set the required environment variables
source setenv.sh

# clear the existing database in local storage
rm -rf ${MONGO_DB_PATH}

# create directory structure
mkdir  ${MONGO_DB_PATH}
mkdir  ${MONGO_DB_PATH}/db
mkdir  ${MONGO_DB_PATH}/configdb
ls -lR  ${MONGO_DB_PATH}


