select  p.S_PIDENTNR nummer,                   
        replace(SUBSTR(DUMP(e."$CUR_ACC_MET_DATA",17), 16), ',','')

from    prd11."$EXT_LF" e, prd11.PART_LIST p, PRD11.CATIA_MODEL c


where   e."$COID" = p."$COID"                                                             
        and                                                                               
        p.S_PIDENTNR like '%THZU041317P0001%'                                                     
        and                                                                               
        e."$COMPID_FATHER" IN c."$COMPID"


GO

