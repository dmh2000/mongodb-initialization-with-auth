
echo ================================
echo TEST
echo ================================
echo mongosh --port 27017 --authenticationDatabase "admin" --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD}
mongosh --port 27017 --authenticationDatabase "admin" --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD} << EOF
use $MONGO_DB_DATABASE
db.foo.insertOne( {x: 1,y: 2 })
db.foo.find( {} )
quit()
EOF