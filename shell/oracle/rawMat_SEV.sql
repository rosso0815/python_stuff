
SELECT * FROM SUM31A.R0ASSMRM where R0CUSTPARTNUMBER = '6015298'
GO
 select ZBINDATA from sum31a.zbindb where OBID = ( select obid from sum31a.r0assmrm where R0CUSTPARTNUMBER = '6015298')
GO