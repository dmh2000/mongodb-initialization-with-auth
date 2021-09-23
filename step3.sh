#!/bin/bash

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
        {role: "readWriteAnyDatabase", db: "admin"}
      ]
  }
)
db.adminCommand( { shutdown: 1} )
quit()
EOF

