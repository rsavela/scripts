#!/bin/bash

# This script will dump the pfiles form all running databases.  It 
# requires Bash 4 or newer.
#
#  (C) Dell Marketing L.P.
#  Russ Savela, 2/3/201
ORACLE_HOME=/app/oracle/product/11.2.0.4/dbhome_1
export ORACLE_HOME

for db in `ps aux| grep pmon | awk '{ print $11}'`
do
        if [[ $db == ora_pmon_* ]]
        then
                echo "Trying to get spfile for ${db:9}"
                # append '1' if RAC
                ORACLE_SID="${db:9}"
                #ORACLE_SID="${db:9}1"
                export ORACLE_SID

                # Connect to Oracle and get the spfile
                ${ORACLE_HOME}/bin/sqlplus / as sysdba <<EOF 2>&1 | tee ${db:9}.parameter

                show parameter;
EOF


        fi
done
