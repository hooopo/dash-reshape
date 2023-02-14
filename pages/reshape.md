## Issues Per Month

```issues_per_month
select date_format(created_at, '%Y-%m-01') as date, count(*) as issues_count from issues  group by 1 order by 1 asc;
```

<AreaChart 
    data={issues_per_month} 
    x=date 
    y=issues_count
/>