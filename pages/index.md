# Welcome to Evidence! 👋


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
    title="The running total of stars per month"
    x=month 
    y=total_stars
/>

```star_region
SELECT region, COUNT(*) AS users_count
FROM stars
WHERE region IS NOT NULL
GROUP BY region
ORDER BY users_count DESC
LIMIT 10;
```

<BarChart 
    data={star_region}  
    title="Geographic distribution of stargazers for repo's user base"
    x=region 
    y=users_count
   
/>



## Schema

```dbs
show databases;
```

<DataTable
    data={dbs} 
    rows=20
    rowNumbers=false
/>

## Write Markdown
Evidence creates pages from markdown files. The file for this page is:

`[my-project]/pages/index.md`.

👉 Open this file, change some text and save it to see this page update instantly.

# Connect your Database
👉 Connect to a database in the **Settings** menu. For this tutorial, choose a **DuckDB** database and enter the filename `needful_things.duckdb`.

Evidence supports Snowflake, BigQuery, Redshift, Postgres, SQLite, DuckDB & [more](https://docs.evidence.dev/getting-started/connect-database)!

![Connecting a database](connect-db.gif)

## Run SQL
Write queries using markdown code fences ` ``` `:

```total_items
select count(*) from hackernews.items
```

You can see both the SQL and the query results by interacting with the query above.

👉 Edit the above query to just display 2021 data by adding:

`where order_datetime >= '2021-01-01'`

## Include Values in Text
Return values from queries in text: 

Last month customers placed <Value data={total_items} column=number_of_items/> orders.

Sometimes you need something *bigger*: 
<BigValue data={total_items} value=sales_usd0k />

👉 Add another `<BigValue/>` above showing `average_order_value_usd2`.

## Add Charts & Components
Charts can be included in a single line of code:

<BarChart data = {total_items} y=sales_usd0k title = 'Sales by Month, USD' />

👉 Change the chart to a `LineChart`.

# Use Control Logic 🎛️
Evidence supports using conditionals & loops to determine what text and data is displayed.

<BigLink href="/control-logic">Using Control Logic &rarr;</BigLink>

# Share your Project 
To get your project online, see the deployment instructions in the [settings menu](/settings). More info is available in our [docs](https://docs.evidence.dev/deployment/deployment-overview).

If you would prefer not to self-host your project, you might be interested in our upcoming cloud service, [Evidence Cloud](https://du3tapwtcbi.typeform.com/to/kwp7ZD3q). 

# Get Support 💬
- Message us on [Slack](https://join.slack.com/t/evidencedev/shared_invite/zt-uda6wp6a-hP6Qyz0LUOddwpXW5qG03Q)
- See all the charts and components in the [component library](https://docs.evidence.dev/features/charts/examples)
- Read the [Docs](https://docs.evidence.dev/)
- Open an issue on [Github](https://github.com/evidence-dev/evidence)