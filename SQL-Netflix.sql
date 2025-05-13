--  1. which genres are the most popular globally ?
select listed_in, count(*) as total_titles
from netflix_titles
group by listed_in
order by total_titles desc
limit 10;

-- 2. how has netflix's content production grown over the years?
select release_year, count(*) as content_count
from netflix_titles
group by release_year
order by release_year;

-- 3. which type of content (movie or tv show) dominates each year ?
select release_year, type, count(*) as count
from netflix_titles
group by release_year, type
order by release_year, type;

-- 4. which countries contribute the most content to netflix ?
select country, count(*) as total
from netflix_titles
where country is not null and country != ''
group by country
order by total desc
limit 10;

-- 5. who are the top directors with the most content on netflix?
select director, count(*) as total_content
from netflix_titles
where director is not null and director != ''
group by director
order by total_content desc
limit 10;

-- 6. how does the age rating distribution vary over the years?
select release_year, rating, count(*) as total
from netflix_titles
where rating is not null
group by release_year, rating
order by release_year, rating;

-- 7. which directors consistently work with the same cast members?
select 
    director, cast, count(*) as collaboration_count
from 
    netflix_titles
where 
    director is not null and cast is not null
group by 
    director, cast
having 
    collaboration_count > 1
order by 
    collaboration_count desc
limit 10;


-- 8. what are the top genres in india?
select listed_in, count(*) as total
from netflix_titles
where country like '%india%'
group by listed_in
order by total desc
limit 10;

-- 9. how has the ratio of movies to tv shows changed over time?
select release_year, 
       sum(case when type = 'movie' then 1 else 0 end) as movies,
       sum(case when type = 'tv show' then 1 else 0 end) as tv_shows
from netflix_titles
group by release_year
order by release_year;

-- 10. what are the most common movie durations?
select duration, count(*) as total
from netflix_titles
where type = 'movie'
group by duration
order by total desc;

-- 11. which genres dominate tv shows vs movies?
select type, listed_in, count(*) as total
from netflix_titles
group by type, listed_in
order by total desc;

-- 12. how many titles are international collaborations?
select count(*) as multi_country_titles
from netflix_titles
where country like '%,%';

-- 13. which countries have the most variety of content (movies and tv shows) in terms of different genres?
select 
    country, 
    count(distinct listed_in) as genre_variety
from 
    netflix_titles
where 
    country is not null and listed_in is not null
group by 
    country
order by 
    genre_variety desc
limit 10;


-- 14. which countries are underrepresented in netflix’s library?
select country, count(*) as total
from netflix_titles
where country is not null and country != ''
group by country
having total < 5
order by total;

-- 15. which countries produce more tv shows than movies for netflix?
select 
    country,
    sum(case when type = 'tv show' then 1 else 0 end) as tv_shows,
    sum(case when type = 'movie' then 1 else 0 end) as movies
from 
    netflix_titles
where 
    country is not null
group by 
    country
having 
    tv_shows > movies
order by 
    tv_shows - movies desc;

