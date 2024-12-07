CREATE TABLESPACE TOOLS                                                         
DATAFILE '/oracle//SYSTEM/DMA12/tools01.dbf' SIZE 8388608 REUSE                
AUTOEXTEND ON NEXT 40                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 32768 NEXT 32768 MINEXTENTS 1 MAXEXTENTS 4096          
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         

CREATE TABLESPACE RBS                                                           
DATAFILE '/oracle//RBS/DMA12/rbs01.dbf' SIZE 209715200 REUSE                
AUTOEXTEND ON NEXT 640                                                          
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 524288 NEXT 524288 MINEXTENTS 8 MAXEXTENTS 4096        
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TEMP                                                          
DATAFILE '/oracle//TEMP/DMA12/temp01.dbf' SIZE 71303168 REUSE                
AUTOEXTEND ON NEXT 80                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 65536 NEXT 65536 MINEXTENTS 1 MAXEXTENTS  PCTINCREASE 0
)                                                                               
ONLINE;                                                                         
CREATE TABLESPACE USERS                                                         
DATAFILE '/oracle//SYSTEM/DMA12/users01.dbf' SIZE 10485760 REUSE               
AUTOEXTEND ON NEXT 160                                                          
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 131072 NEXT 131072 MINEXTENTS 1 MAXEXTENTS 4096        
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         
CREATE TABLESPACE INDX                                                          
DATAFILE '/oracle//INDEX/DMA12/indx01.dbf' SIZE 31457280 REUSE                
AUTOEXTEND ON NEXT 160                                                          
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 131072 NEXT 131072 MINEXTENTS 1 MAXEXTENTS 4096        
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         
CREATE TABLESPACE TBS_DICORDB                                                   
DATAFILE '/oracle/DATA/DMA12/Tbs_DICORDB.dbf' SIZE 10485760 REUSE        
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_ADMIN                                                     
DATAFILE '/oracle/DATA/DMA12/Tbs_ADMIN.dbf' SIZE 10485760 REUSE          
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_PEOPLE                                                    
DATAFILE '/oracle/DATA/DMA12/Tbs_PEOPLE.dbf' SIZE 10485760 REUSE         
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_SECURITY                                                  
DATAFILE '/oracle/DATA/DMA12/Tbs_SECURITY.dbf' SIZE 10485760 REUSE       
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_DICO                                                      
DATAFILE '/oracle/DATA/DMA12/Tbs_DICO.dbf' SIZE 10485760 REUSE           
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_INDEX                                                     
DATAFILE '/oracle/INDEX/DMA12/Tbs_INDEX.dbf' SIZE 10485760 REUSE          
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_CONFIG                                                    
DATAFILE '/oracle/DATA/DMA12/Tbs_CONFIG.dbf' SIZE 10485760 REUSE         
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_PUBSUB                                                    
DATAFILE '/oracle/DATA/DMA12/Tbs_PUBSUB.dbf' SIZE 10485760 REUSE         
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE TBS_PRODUCT                                                   
DATAFILE '/oracle/DATA/DMA12/Tbs_PRODUCT.dbf' SIZE 10485760 REUSE        
AUTOEXTEND ON NEXT 63                                                           
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 16384 NEXT 57344 MINEXTENTS 1 MAXEXTENTS 200           
PCTINCREASE 10 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE CDMCOR                                                        
DATAFILE '/oracle/DATA/DMA12/cdmcor' SIZE 3145728 REUSE                  
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE CDMLFR                                                        
DATAFILE '/oracle/DATA/DMA12/cdmlfr' SIZE 5242880 REUSE                  
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE CDMIND                                                        
DATAFILE '/oracle/DATA/DMA12/cdmind' SIZE 3145728 REUSE                  
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE CATIA                                                         
DATAFILE '/oracle/DATA/DMA12/CATIA' SIZE 5242880 REUSE                   
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE VPMENV                                                        
DATAFILE '/oracle/DATA/DMA12/VPMENV' SIZE 10485760 REUSE                 
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE DMAGS1                                                        
DATAFILE '/oracle/DATA/DMA12/DMAGS1' SIZE 41943040 REUSE                     
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 50 )                                                                
ONLINE;                                                                         
CREATE TABLESPACE DMAGS1I                                                       
DATAFILE '/oracle/INDEX/DMA12/DMAGS1I' SIZE 20971520 REUSE                    
EXTENT MANAGEMENT DICTIONARY                                                    
DEFAULT STORAGE (INITIAL 40960 NEXT 40960 MINEXTENTS 1 MAXEXTENTS 505           
PCTINCREASE 0 )                                                                 
ONLINE;                                                                         
