#!/bin/bash

/etc/init.d/postgresql start 
until pg_isready -t 0; do sleep 0.1; done
su -c "createdb codeuser" - postgres
su -c "createuser --createdb codeuser" - postgres
exec "$@"
