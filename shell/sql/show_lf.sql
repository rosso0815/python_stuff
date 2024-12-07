select replace(SUBSTR(DUMP("$CUR_ACC_MET_DATA",17), 16), ',','')PATH
        from archive."$EXT_LF" WHERE "$CUR_ACC_MET" <> 'DBLFCDM'
        and "$COID"='&Dollar_COID';

