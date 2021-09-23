# SOURCE THIS FILE
# set the password as an environment variable
# do this in a separate file so the exports are visible in all scripts
export MONGO_ADMIN_PASSWORD=12345
export MONGO_USER_PASSWORD=54321
export MONGO_DATABASE_PATH=~/projects/mongo/db

# clear the existing database path and recreate it
rm -rf ${MONGO_DATABASE_PATH}
mkdir ${MONGO_DATABASE_PATH}
ls -l ${MONGO_DATABASE_PATH}/..
