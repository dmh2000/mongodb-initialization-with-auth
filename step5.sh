#!/bin/bash

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

