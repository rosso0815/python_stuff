drop table author;

CREATE TABLE AUTHOR
(
  AUT_ID NUMBER NOT NULL,
  AUT_NAME VARCHAR2(20),
  AUT_LOC VARCHAR2(200)
, CONSTRAINT AUTHOR_PK PRIMARY KEY
  (
    AUT_ID
  )
  ENABLE
)
;

CREATE SEQUENCE  "BOOK"."AUT_SEQ"  
	MINVALUE 1 
	MAXVALUE 999999999999999999999999999 
	INCREMENT BY 1 START WITH 100 
	CACHE 20 NOORDER  NOCYCLE ;
	

CREATE OR REPLACE TRIGGER "BOOK"."INSERT_AUTHOR" 
BEFORE INSERT ON author
FOR EACH ROW
DECLARE
  cust_id number;
BEGIN
  SELECT auth_seq.nextval
    INTO cust_id
    FROM dual;
  :new.AUT_ID := cust_id;
END;
/

ALTER TRIGGER "BOOK"."INSERT_AUTHOR" ENABLE;
 
insert into author ( aut_name , aut_loc ) values ( 'pfistera', 'switzerland');
