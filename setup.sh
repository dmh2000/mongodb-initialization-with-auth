#!/bin/bash

# set the password as an environment variable
# do this in a separate file so the exports are visible in all scripts
# export MONGO_ADMIN_PASSWORD=12345
# export MONGO_USER_PASSWORD=54321
# export MONGO_DATABASE_PATH=~/projects/mongo/db

# clear the existing database path and recreate it
rm -rf ${MONGO_DATABASE_PATH}
mkdir ${MONGO_DATABASE_PATH}
ls -l ${MONGO_DATABASE_PATH}/..

echo ================================
echo START MONGODB WITH NEW DATABASE
echo ================================
echo mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --dbpath=${MONGO_DATABASE_PATH}
mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --dbpath=${MONGO_DATABASE_PATH}

# wait 5 seconds for it to start
echo sleep 5 for restart
sleep 5

echo ================================
echo STEP 1 CREATE USER ADMINSTRATOR
echo ================================
mongosh --port 27017 <<EOF
use admin
db.createUser(
    {
      user:"userAdmin",
      pwd:"$MONGO_ADMIN_PASSWORD",
      roles: [
        {role: "userAdminAnyDatabase", db: "admin"},
        {role: "readWriteAnyDatabase", db: "admin"},
        {role: "hostManager", db: "admin"}
      ]
  }
)
db.adminCommand( { shutdown: 1} )
quit()
EOF

echo ====================================================
echo RESTART MONGODB WITH NEW DATABASE WITH AUTHENTICATION
echo ====================================================
echo mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --auth --port 27017 --dbpath ${MONGO_DATABASE_PATH}
mongod --fork --logpath ${MONGO_DATABASE_PATH}/testlog --auth --port 27017 --dbpath ${MONGO_DATABASE_PATH}

# wait 5 seconds for it to start
echo sleep 5 for restart
sleep 5

echo ================================
echo STEP 2 CREATE A NEW USER
echo ================================
# connect as admin and create a user
echo mongosh --port 27017 --authenticationDatabase "admin" --username "userAdmin" --password ${MONGO_ADMIN_PASSWORD}
mongosh --port 27017 --authenticationDatabase "admin" --username "userAdmin" --password ${MONGO_ADMIN_PASSWORD} <<EOF
db.createUser(
  {
    user:"retro",
     pwd: "$MONGO_USER_PASSWORD",
     roles: [
       { role: "readWrite", db:"test"}
     ]
   }
)
quit()
EOF

echo ================================
echo TEST
echo ================================
echo mongosh --port 27017 --authenticationDatabase "test"  --username retro --password ${MONGO_USER_PASSWORD} 
mongosh --port 27017 --authenticationDatabase "test"  --username retro --password ${MONGO_USER_PASSWORD} <<EOF
use test
db.foo.insertOne( {x: 1,y: 2 })
db.foot.find( {} )
quit()
EOF
