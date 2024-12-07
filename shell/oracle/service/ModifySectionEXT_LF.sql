/* 
||  This PL/SQL function only let you change a value in the path for another one.
||  - To use it, you need to be in a window that had been sourced.
||  - You need to log on sqlplus under the environment name (ex: PILOT1/PILOT1)
||  - You write the @ and the location path for the script 
||    (ex: @HOME/aap/dev/ModifySectionEXT_LF.sql)
||  - To execute the script you need to put "/"
||  - When you answer the question make sure to put /var/ 
||    (ex:Enter value for old_section:/aap/)    
*/

SET LINE 200
SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE

/* Declaration of the cursor that's going to get our result in a buffer */
  CURSOR changes IS
    SELECT REPLACE("$CUR_ACC_MET_DATA",HEXTORAW(RAWTOHEX('&old_section')),
    HEXTORAW(RAWTOHEX('&new_section'))) Replacement, "$COID" COID, "$COMPID" COMPID FROM 
    "$EXT_LF"; 

/* Declaration of a record with the same type as the values that we selected */   
  changes_rec changes%ROWTYPE;
  
BEGIN

/* Opening the cursor */
  OPEN changes;
  LOOP

/* Putting the informations in the record */ 
    FETCH changes into changes_rec;

/* If we don't have any other selected rows, we exit */
    IF changes%NOTFOUND
    THEN
      EXIT;

/* We do the update for each rows */
    ELSE
      UPDATE "$EXT_LF" SET "$CUR_ACC_MET_DATA"=changes_rec.Replacement
      WHERE "$COID"=changes_rec.COID AND "$COMPID"=changes_rec.COMPID;
      COMMIT; 
    END IF;

  END LOOP;

/* Closing the cursor */
  CLOSE changes;

END; 

