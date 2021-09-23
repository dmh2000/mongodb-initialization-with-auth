echo ====================================================
echo RESTART MONGODB WITH NEW DATABASE WITH AUTHENTICATION
echo ====================================================
echo mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --auth --port 27017 --dbpath ${MONGO_DATABASE_PATH}
mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --auth --port 27017 --dbpath ${MONGO_DATABASE_PATH}

# wait 5 seconds for it to start
echo sleep 5 for restart
sleep 5
