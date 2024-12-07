select "$COMPID", P_TITLE  from ARCHIVE.PART_LIST
        where "$COID" IN
        (
        select "$COID" from ARCHIVE.PART_LIST
        MINUS
        select "$COID" from  ARCHIVE.CATIA_MODEL
        );

