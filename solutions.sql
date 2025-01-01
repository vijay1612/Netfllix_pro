-- Netflix Project
DROP TABLE IF EXISTS netflix;
create table netflix
(
   show_id	VARCHAR(6),
   type     VARCHAR(10),
   title   VARCHAR(150),
   director VARCHAR(208),
   casts    VARCHAR(1000),
   country VARCHAR(150),
   date_added VARCHAR(50),
   release_year INT,
   rating	   VARCHAR(10),
   duration    VARCHAR(15),
   listed_in   VARCHAR(100),
   description VARCHAR(250)
)
SELECT * FROM netflix;



SELECT
COUNT(*) AS total_content
FROM netflix;


SELECT
DISTINCT type
from netflix;

SELECT * FROM netflix


-- 1. Count the number of movies vs TV shows
SELECT 
type,
COUNT(*) as total_content
FROM netflix
GROUP BY type

-- 2. Find the most common rating for movies and TV shows
SELECT 
    type, 
    rating
FROM (
    SELECT 
        type,
        rating,
        COUNT(*) AS count,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
    FROM netflix
    GROUP BY type, rating
) AS t1
WHERE ranking = 1;

--3.List all movies released in 2020
Select * from netflix
 WHERE type = 'Movie' AND release_year = 2020

 --4. Find the top 5 countries with most content on netflix
SELECT 
    unnest(STRING_TO_ARRAY(country, ',')) AS new_country,
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY new_country
ORDER BY total_content DESC
LIMIT 5;

--5. Identify the longest duration movie?
select * from netflix
 where type = 'Movie' and duration = (select max(duration)from netflix)
--6. Find Content added in the last five years
select * from netflix
where
     TO_DATE(date_added, 'Month DD, YYYY') >= current_date - interval '5 years'
--7. Find all movies/TV shows by director 'Rajiv chilaka'
select * from netflix
where director ILIKE '%Rajiv Chilaka%'
--8. List all TV shows with more that 5 seasons
select * from netflix
where
Type = 'TV Show' And SPLIT_PART(duration, ' ', 1)::numeric > 5
--9. Count the nuber of content items in each gernre
select
UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
count(show_id) as total_content
from netflix
group by 1
--10.Find each year and the average number of content release by USA on netflix return top 5 years with highest avg content release
SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added, 'FMMonth DD, YYYY')) AS year,
    COUNT(*) AS yearly_content,
    ROUND(
        (COUNT(*)::numeric / (SELECT COUNT(*) FROM netflix WHERE country = 'United States')) * 100, 2
    ) AS avg_content_per_year
FROM netflix
WHERE country = 'United States'
GROUP BY year
--11.List all the movies that are documenteries
select * from netflix
  where listed_in ILIKE '%Documentaries%'
--12. Find all the content without director
select * from netflix
where director is null
--13. Find how many movies actor "Luis Ernesto Franco" appeared in last 10 years
select * from netflix
where casts ILIKE '%Luis Ernesto Franco%' and release_year > extract(year from current_date) - 10

---14.Find the top 10 actors who have appeared with the highest number of movies produced in United states.
select Casts from netflix
 where country = 'United States'

Select 
--show_id, Casts,
unnest(string_to_array(Casts, ' ')) as actors
 count(*) as total_content
 from netflix
 Group by 1

 SELECT 
    unnest(string_to_array(Casts, ' ')) AS actors,
    COUNT(*) AS total_content
FROM netflix
where country ilike 'United States'
GROUP BY 1
order by 2 desc
LIMIt 10

--15.Catagorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords has 'bad' and all other contents as 'good'. count how many items fall in each category
with new_table
as(
select * ,
case 
   when description ilike '%kill%'
   or description ilike '%violence%' then 'bad'
   else 'good content'
   end category
from netflix
)
select category,
count(*) as total_content
from new_table
group by 1

