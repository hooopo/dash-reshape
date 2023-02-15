# ✨ Analysis of GitHub repo stars


## Basic Info

```info
select 'Full Name' as name,  concat(owner, '/', name) as value from repos
union
select 'Description' as name,  description as value from repos
union
select 'License' as name, license as value from repos
union
select 'Language' as name, language as value from repos
union
select 'Fork Count' as name, fork_count as value from repos
union
select 'Stargazer Count' as name, stargazer_count as value from repos
union
select 'Issue Count' as name, count(*) as value from issues 
union 
select 'Pull Request Count' as name, count(*) as value from pull_requests
union
select 'Contributors' as name, count(distinct author) as value from pull_requests
```

<DataTable
    data={info} 
    rows=20
    rowNumbers=false
/>

## The running total of stars per month

```star_history
WITH monthly_stars AS (
  SELECT DATE_FORMAT(starred_at, '%Y-%m') AS month, COUNT(*) AS total_stars
  FROM stars
  GROUP BY month
)
SELECT month, total_stars AS month_stars, SUM(total_stars) OVER (ORDER BY month) AS total_stars
FROM monthly_stars
ORDER BY 1 ASC
```

<LineChart 
    data={star_history}  
    x=month 
    y=total_stars
/>

## Stars per month

```stars_per_month

  SELECT DATE_FORMAT(starred_at, '%Y-%m') AS month, COUNT(*) AS total_stars
  FROM stars
  GROUP BY month
  ORDER BY 1 ASC;

```

<AreaChart 
    data={stars_per_month}  
    x=month 
    y=total_stars
/>

## Geographic distribution of stargazers for repo

```star_region
SELECT region AS name, COUNT(*) AS value
FROM stars
WHERE region IS NOT NULL AND region != 'N/A'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

<ECharts config={
    {
        tooltip: {
            formatter: '{b}: {c}'
        },
      series: [
        {
          type: 'treemap',
          visibleMin: 400,
          label: {
            show: true,
            formatter: '{b}'
          },
          itemStyle: {
            borderColor: '#fff'
          },
          roam: false,
          nodeClick: false,
          data: star_region,
          breadcrumb: {
            show: false
          }
        }
      ]
      }
    }
/>


```star_company
select REPLACE(LOWER(company), '@', ''), count(*) 
from stars 
group by 1 
order by 2 desc 
limit 20;
```
