rem =========================================================================
rem 
rem                     tsusage.sql
rem 
rem     Copyright (C) Oriole Software, 1998
rem 
rem     This program is free software; you can redistribute it and/or modify
rem     it under the terms of the GNU General Public License as published by
rem     the Free Software Foundation; either version 2 of the License, or
rem     any later version.
rem 
rem     This program is distributed in the hope that it will be useful,
rem     but WITHOUT ANY WARRANTY; without even the implied warranty of
rem     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem     GNU General Public License for more details.
rem 
rem     You should have received a copy of the GNU General Public License
rem     along with this program; if not, write to the Free Software
rem     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
rem 
rem =========================================================================
rem
rem # Tablespace usage
rem
rem ==========================================================================
rem
column name heading "TABLESPACE" format A25
column "SIZE (M)" format 99999990.9
column "USED (%)" format 990
column ts# noprint
column name heading "TABLESPACE"
break on report
compute sum of "SIZE (M)" on report
select ts.ts#,
       ts.name,
       ((sp.allocated_blocks + sp.files) * ts.blocksize / 1024 /1024)
                       "SIZE (M)",
       round(100 * sum(nvl(s.blocks, 0)) / sp.allocated_blocks)
                                 "USED (%)"
from sys.ts$ ts,
     (select ts#,
             sum(blocks) - count(*) allocated_blocks,
             count(*) files
      from sys.file$
      where status$ != 1
      group by ts#) sp,
     sys.seg$ s
where ts.online$ != 3
  and sp.ts# = ts.ts#
  and s.ts# (+) = ts.ts#
group by ts.ts#, ts.name, sp.allocated_blocks, sp.files, ts.blocksize
order by ts.ts#
/
