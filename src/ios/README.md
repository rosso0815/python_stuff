#

## SQL

```

echo "select count(size) s,size , string_agg(path, ',') from picture group by size order by s asc" | psql -h localhost -U postgres -d dvdrental
 
 ```
