#!/bin/bash


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