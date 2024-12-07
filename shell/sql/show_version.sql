select s_part_number,s_version ,c_part_version, c_maturity from dmags1.part_list
where
s_part_number like 'TEST011';
