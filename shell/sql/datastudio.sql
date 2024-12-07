
select g.g , g.text from gross g,mittel m,klein k where g.text = '32705' and g.g = m.m and g.g = k.k
go


select count(*) from GROSS
GO

select count(*)
from GROSS g,MITTEL m,KLEIN k
where
g.g = m.M
and
g.g = k.K
and
g=10
GO
