#!/bin/bash

echo ================================
echo STEP 3 CREATE A NEW USER
echo ================================
# connect as admin and create a user
echo mongosh --port 27017 --authenticationDatabase "admin" --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD}
mongosh --port 27017 --authenticationDatabase "admin" --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD} << EOF
use $MONGO_DB_DATABASE
db.createUser(
  {
    user:"$MONGO_DB_USERNAME",
     pwd: "$MONGO_DB_PASSWORD",
     roles: [
       { role: "readWrite", db:"$MONGO_DB_DATABASE"}
     ]
   }
)
quit()
EOF
