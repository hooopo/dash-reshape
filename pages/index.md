# ✨ Analysis of GitHub repo stars

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
