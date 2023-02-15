
## Repo
```repos
desc repos
```

<DataTable
    data={repos} 
    rows=20
    rowNumbers=false
/>

```repo_sample
select * from repos order by id desc limit 10;
```

<DataTable
    data={repo_sample} 
    rows=20
    rowNumbers=false
/>

## Star

```stars
desc stars
```

<DataTable
    data={stars} 
    rows=20
    rowNumbers=false
/>

```star_sample
select * from stars order by starred_at desc limit 10;
```

<DataTable
    data={star_sample} 
    rows=20
    rowNumbers=false
/>

## Pull Request
```pull_requests
desc pull_requests
```

<DataTable
    data={pull_requests} 
    rows=20
    rowNumbers=false
/>

```pull_request_sample
select * from pull_requests order by id desc limit 10;
```

<DataTable
    data={pull_request_sample} 
    rows=20
    rowNumbers=false
/>

## Issue
```issues
desc issues
```

<DataTable
    data={issues} 
    rows=20
    rowNumbers=false
/>


```issue_sample
select * from issues order by id desc limit 10;
```

<DataTable
    data={issue_sample} 
    rows=20
    rowNumbers=false
/>

## Fork
```forks
desc forks
```

<DataTable
    data={forks} 
    rows=20
    rowNumbers=false
/>

```fork_sample
select * from forks order by id desc limit 10;
```

<DataTable
    data={fork_sample} 
    rows=20
    rowNumbers=false
/>