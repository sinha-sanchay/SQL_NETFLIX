
# Netflix Content Analysis - SQL Project

## Overview

This project analyzes Netflix's content library using a publicly available dataset. The goal is to explore various aspects of Netflix's content offerings using SQL queries, uncovering trends and insights over time, genre preferences, regional contributions, and more.

## Project Questions & SQL Queries

### 1. which genres are the most popular globally ?
**Query:**
```sql
select listed_in, count(*) as total_titles
from netflix_titles
group by listed_in
order by total_titles desc
limit 10;
````

**Objective:** Identify the top 10 most popular genres on Netflix worldwide.

---

### 2. how has netflix's content production grown over the years?

**Query:**

```sql
select release_year, count(*) as content_count
from netflix_titles
group by release_year
order by release_year;
```

**Objective:** Track the growth of Netflix's content library by year of release.

---

### 3. Which type of content (movie or TV show) dominates each year?

**Query:**

```sql
select release_year, type, count(*) as count
from netflix_titles
group by release_year, type
order by release_year, type;
```

**Objective:** Analyze the dominance of movies vs. TV shows on Netflix for each year.

---

### 4. Which countries contribute the most content to Netflix?

**Query:**

```sql
select country, count(*) as total
from netflix_titles
where country is not null and country != ''
group by country
order by total desc
limit 10;
```

**Objective:** Identify the top 10 countries contributing the most content to Netflix.

---

### 5. Who are the top directors with the most content on Netflix?

**Query:**

```sql
select director, count(*) as total_content
from netflix_titles
where director is not null and director != ''
group by director
order by total_content desc
limit 10;
```

**Objective:** Find the directors with the most content available on Netflix.

---

### 6. How does the age rating distribution vary over the years?

**Query:**

```sql
select release_year, rating, count(*) as total
from netflix_titles
where rating is not null
group by release_year, rating
order by release_year, rating;
```

**Objective:** Examine how Netflix’s age rating distribution has evolved over the years.

---

### 7. Which directors consistently work with the same cast members?

**Query:**

```sql
select director, cast, count(*) as collaboration_count
from netflix_titles
where director is not null and cast is not null
group by director, cast
having collaboration_count > 1
order by collaboration_count desc
limit 10;
```

**Objective:** Identify directors who frequently collaborate with the same cast members.

---

### 8. What are the top genres in India?

**Query:**

```sql
select listed_in, count(*) as total
from netflix_titles
where country like '%india%'
group by listed_in
order by total desc
limit 10;
```

**Objective:** Discover the most popular genres on Netflix in India.

---

### 9. How has the ratio of movies to TV shows changed over time?

**Query:**

```sql
select release_year, 
       sum(case when type = 'movie' then 1 else 0 end) as movies,
       sum(case when type = 'tv show' then 1 else 0 end) as tv_shows
from netflix_titles
group by release_year
order by release_year;
```

**Objective:** Track how the ratio of movies to TV shows has evolved over the years.

---

### 10. What are the most common movie durations?

**Query:**

```sql
select duration, count(*) as total
from netflix_titles
where type = 'movie'
group by duration
order by total desc;
```

**Objective:** Identify the most common durations for movies on Netflix.

---

### 11. Which genres dominate TV shows vs movies?

**Query:**

```sql
select type, listed_in, count(*) as total
from netflix_titles
group by type, listed_in
order by total desc;
```

**Objective:** Compare the genres that dominate TV shows vs. movies on Netflix.

---

### 12. How many titles are international collaborations?

**Query:**

```sql
select count(*) as multi_country_titles
from netflix_titles
where country like '%,%';
```

**Objective:** Count the number of Netflix titles that are international collaborations.

---

### 13. Which countries have the most variety of content (movies and TV shows) in terms of different genres?

**Query:**

```sql
select country, count(distinct listed_in) as genre_variety
from netflix_titles
where country is not null and listed_in is not null
group by country
order by genre_variety desc
limit 10;
```

**Objective:** Identify the countries with the most diverse content libraries on Netflix based on genres.

---

### 14. Which countries are underrepresented in Netflix’s library?

**Query:**

```sql
select country, count(*) as total
from netflix_titles
where country is not null and country != ''
group by country
having total < 5
order by total;
```

**Objective:** Find countries with limited representation in Netflix’s library.

---

### 15. Which countries produce more TV shows than movies for Netflix?

**Query:**

```sql
select country,
    sum(case when type = 'tv show' then 1 else 0 end) as tv_shows,
    sum(case when type = 'movie' then 1 else 0 end) as movies
from netflix_titles
where country is not null
group by country
having tv_shows > movies
order by tv_shows - movies desc;
```

**Objective:** Identify countries where TV shows outnumber movies on Netflix.

---

## Conclusion

By analyzing this dataset, we can uncover interesting insights about Netflix’s content distribution, regional trends, and the evolution of their library over time. This project provides valuable data-driven insights into the streaming platform’s growth and global preferences.

