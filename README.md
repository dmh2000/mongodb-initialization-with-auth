# MONGODB SIMPLE INITIALIZATION WITH AUTHENTICATION

The purpose of this gist is to work through the simplest mongodb setup that:

- creates a database
- enables authentication
- creates a user
- tests the user

I recommend that first you work through the 6 separate steps (_step1.sh_, ...) and get each working in sequence, then fixup _setup.sh_ so that it works all the way through.

This procedure is straight from the (Mongodb Version 5 documentation](https://docs.mongodb.com/manual/tutorial/enable-authentication/), with complete script(s).

## STEP-BY-STEP

1. source step1.sh

Set some environment variables and create a new directory for the mongodb database. Be sure to source this file rather than mark it executable.

2. ./step2.sh

Start mongod with no authentication, pointing at the new empty database directory. Start it as a daemon (--fork xxxx --logpath yyyy)

3. ./step3.sh

Create an admin user that can administer users. This step will stop the mongod instance when it completes.

4. ./step4.sh

Restart mongod with authentication enabled. Again as a daemon

5. ./step5.sh

Create a user (named "retro") with permissions to read and write to database "test".

6. ./step6.sh

Test that the user can insert and read back a document

## THE WHOLE THING IN ONE SCRIPT

be sure to have an empty database location ready

source setenv.sh
./setup.sh
