#/bin/bash

echo ================================
echo START MONGODB WITH NEW DATABASE
echo ================================
echo mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --dbpath=${MONGO_DATABASE_PATH}
mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --dbpath=${MONGO_DATABASE_PATH}

# wait 5 seconds for it to start
echo sleep 5 for restart
sleep 5

