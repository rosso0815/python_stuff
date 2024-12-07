#! /bin/bash

#set 

#exit

export ORACLE_HOME=$HOME/bin/sqlplus_client
export TNS_ADMIN=$HOME/lib/
export DYLD_LIBRARY_PATH=$ORACLE_HOME
    
$DYLD_LIBRARY_PATH/sqlplus $*
