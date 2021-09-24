# MONGODB SIMPLE INITIALIZATION WITH AUTHENTICATION

The purpose of this gist is to work through the simplest mongodb setup that:

- creates a database
  - enables authentication
  - automatically creates admin user with 'root' permissions
- creates a user
- tests the user

I recommend you work throught the 4 steps separately to start with. Once those are working you can run the entire thing with setup.sh (sourced)

This was tested on Unbuntu 21 with locally installed current versions of Mongodb 5.0 and Mongosh (shell) 1.0.7. It seems like the distribution versions (with apt) are always a bit too old.

The scripts use [Bash Here Documents](https://tldp.org/LDP/abs/html/here-docs.html) to pipe commands into the mongo shell. If you aren't familiar with them, read about it here. By convention, the string EOF is used as the bracketing delimiter.

## STEP-BY-STEP

1. source step1.sh

This step prepares the system for creating a new instance of docker/mongodb . It clears any existing environment variables, sets the new ones, removes existing database files in local storage and removes any existing container from previous iterations.

2. ./step2.sh

Uses docker-compose to start the instance of mongodb. The setup in docker-compose.yml will cause docker and mongodb to automatically create an admin user with the specified name and password. The admin user will have root privileges.

Update the following fields in docker-compose.yml if needed:

- user
  - needs to be a UID:GID that exists on the current system
  - the database files and directories will be created with this value
- ports
- restart

3. ./step3.sh

Creates a new database ($MONGO_DB_DATABASE) and a user with read/write privileges for that database.

4. ./step4.sh

Tests that the user can insert and read back a document

## setup.sh

The whole thing in one script. Needs to be sourced.
