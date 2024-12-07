CREATE TABLESPACE TOOLS                                                         
DATAFILE '/oracle//oradata/VPMBUF/tools01.dbf' SIZE 8388608 REUSE               
AUTOEXTEND ON NEXT 40                                                           
MAXSIZE 34359721984                                                             
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 32768 NEXT 32768 MINEXTENTS 1 MAXEXTENTS 4096          
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         
CREATE TABLESPACE RBS                                                           
DATAFILE '/oracle//oradata/VPMBUF/rbs01.dbf' SIZE 209715200 REUSE               
AUTOEXTEND ON NEXT 640                                                          
MAXSIZE 34359721984                                                             
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 524288 NEXT 524288 MINEXTENTS 8 MAXEXTENTS 4096        
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TEMP                                                          
DATAFILE '/oracle//oradata/VPMBUF/temp01.dbf' SIZE 71303168 REUSE               
AUTOEXTEND ON NEXT 80                                                           
MAXSIZE 34359721984                                                             
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 65536 NEXT 65536 MINEXTENTS 1 MAXEXTENTS  PCTINCREASE 0
)                                                                               
ONLINE;                                                                         
CREATE TABLESPACE USERS                                                         
DATAFILE '/oracle//oradata/VPMBUF/users01.dbf' SIZE 10485760 REUSE              
AUTOEXTEND ON NEXT 160                                                          
MAXSIZE 34359721984                                                             
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 131072 NEXT 131072 MINEXTENTS 1 MAXEXTENTS 4096        
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         
CREATE TABLESPACE INDX                                                          
DATAFILE '/oracle//oradata/VPMBUF/indx01.dbf' SIZE 31457280 REUSE               
AUTOEXTEND ON NEXT 160                                                          
MAXSIZE 34359721984                                                             
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 131072 NEXT 131072 MINEXTENTS 1 MAXEXTENTS 4096        
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         
CREATE TABLESPACE DMAGS1                                                        
DATAFILE '/oracle/oradata/VPMBUF/DMAGS1' SIZE 41943040 REUSE                    
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE DMAGS1I                                                       
DATAFILE '/oracle/oradata/VPMBUF/DMAGS1I' SIZE 20971520 REUSE                   
, '/oracle/oradata/VPMBUF/DMAGS1I_1' SIZE 26222592 REUSE                        
AUTOEXTEND ON NEXT 1                                                            
MAXSIZE 34359721984                                                             
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         

PL/SQL procedure successfully completed.

