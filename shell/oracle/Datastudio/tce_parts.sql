
SELECT partnumber, upper(obid), lastupdate FROM SUM31A.R0ASSMCP where PARTNUMBER like '%275%' order by LASTUPDATE desc
GO

select * from sum31a.ATTACH where RIGHT = 'qgxgxCkwinds0sum31a--fqm'
GO

select  VERSIONNUMBER, LASTUPDATE,WORKINGRELATIVEPATH, RELATIVEPATH from sum31a.PDFFILE where WORKINGRELATIVEPATH like 'User%'
GO

select lastupdate, WORKINGRELATIVEPATH, RELATIVEPATH from sum31a.WORDDOC where WORKINGRELATIVEPATH like 'User%'
GO