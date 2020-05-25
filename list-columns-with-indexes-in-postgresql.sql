-- select
--     t.relname as table_name,
--     i.relname as index_name,
--     array_to_string(array_agg(a.attname), ', ') as column_names
-- from
--     pg_class t,
--     pg_class i,
--     pg_index ix,
--     pg_attribute a
-- where
--     t.oid = ix.indrelid
--     and i.oid = ix.indexrelid
--     and a.attrelid = t.oid
--     and a.attnum = ANY(ix.indkey)
--     and t.relkind = 'r'
--     and t.relname not like 'pg_%'
-- group by
--     t.relname,
--     i.relname
-- order by
--     t.relname,
--     i.relname;

with index_data as (
  select 
    t.relname as table_name, 
    i.relname as index_name, 
    a.attname as column_name 
  from 
    pg_class t, 
    pg_class i, 
    pg_index ix, 
    pg_attribute a 
  where 
    t.oid = ix.indrelid 
    and i.oid = ix.indexrelid 
    and a.attrelid = t.oid 
    and a.attnum = ANY(ix.indkey) 
    and t.relkind = 'r'
) 
select 
  c.table_name, 
  c.column_name, 
  i.index_name 
from 
  information_schema.columns as c 
  left join index_data as i on i.table_name = c.table_name 
  and i.column_name = c.column_name 
where 
  c.table_schema = 'public' 
order by 
  c.table_name, 
  c.column_name, 
  i.index_name
