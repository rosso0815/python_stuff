select
p.s_part_number, p.c_maturity, c.c_maturity
from dmags1.part_list p, dmags1.catia_model c
where
p."$COID" = c."$COID"
and
p.s_part_number like 'TEST009'
/
