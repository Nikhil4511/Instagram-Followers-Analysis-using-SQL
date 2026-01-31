-- Database use college
use college;

create table instagram_account ( 
	rank_Posotion INT,
    username VARCHAR(50),
    owner VARCHAR(100),
    followers_millions DECIMAL(6,2),
    profession VARCHAR(150),
    country VARCHAR(50)
);              

select * from instagram_account;

SELECT username, followers_millions FROM instagram_account;

-- Q1. Top 10 most followed accounts
select * 
from instagram_account
order by followers_millions desc
limit 10;

-- Q2. find account name and follower by rank.
select username, followers_millions, country
from instagram_account
where rank_Posotion = 16;

-- Q3. find distinct country.
select distinct country
from instagram_account;

-- Q4. Total no. of account
select count(*) as total_account
from instagram_account;

-- Q5. find follower greater than 300 millions.
select * from instagram_account
where followers_millions > 300;

-- Q6. Find the owner name and with their followers greater than 230 and country name.
select owner, followers_millions, country
from instagram_account
where followers_millions > 230;

-- Q7. Find profession wise account. 
select owner, followers_millions
from instagram_account
where profession = 'Footballer';

--
select owner, followers_millions
from instagram_account
where profession = 'Television personality, model and businesswoman';

--
select owner, followers_millions
from instagram_account
where profession = 'Comedian and television personality';

-- Q8. find country wise account.
select owner, followers_millions
from instagram_account
where country = 'United States';

--
select owner, followers_millions
from instagram_account
where country = 'india';

-- Q9. Find profession wise account
SELECT * 
FROM instagram_account
WHERE profession LIKE '%Musician%';

--
SELECT * 
FROM instagram_account
WHERE profession LIKE '%Actress%';

--
select * 
from instagram_account
where profession like '%model%';

--
select * from instagram_account
order by followers_millions asc;

--
select * from instagram_account
where profession not like '%Platform%'
order by followers_millions desc
limit 17;

-- Max Followers from dataset
select max(followers_millions) as max_follower
from instagram_account;

-- Min Followers from dataset
select min(followers_millions) as min_follower
from instagram_account;

-- Avg Followers from dataset
select avg(followers_millions) as avg_followers
from instagram_account;

-- Total followers
select sum(followers_millions) as total_follwers
from instagram_account;

-- Q10. Country wise avg followers.
select avg(followers_millions) as avg_follwers
from instagram_account
where country = 'United States';

---
select avg(followers_millions) as avg_follwers
from instagram_account
where country = 'india';

--
select sum(followers_millions) as sum_follwers
from instagram_account
where country = 'india';

-- Total account that particular country.
select country, count(*) as total_account
from instagram_account
group by country;

-- Avg followers each country.
select country, avg(followers_millions) as avg_followers
from instagram_account
group by country;

-- Sum followers
select country, sum(followers_millions) as total_followers
from instagram_account
group by country;

-- Q11. Country where account more than two.
select country, count(*) as total_account
from instagram_account
group by country
having count(*) >= 2;

--
select * from instagram_account
order by followers_millions desc
limit 1 offset 1;

--
SELECT *
FROM instagram_account
WHERE Followers_millions > (SELECT AVG(Followers_millions) FROM instagram_account);

-- Q12. Count how many accounts belong to each profession
SELECT profession, COUNT(*) AS total_accounts
FROM instagram_account
GROUP BY profession
ORDER BY total_accounts DESC;

-- Q13. Top 5 professions by total followers
select profession, sum(followers_millions) as total_followers
from instagram_account
group by profession
order by total_followers desc
limit 5;

-- Q14. Find the most-followed account in each profession
SELECT *
FROM (
    SELECT username,
           profession,
           followers_millions,
           RANK() OVER (PARTITION BY profession ORDER BY followers_millions DESC) AS rnk
    FROM instagram_account
) t
WHERE rnk = 1;

-- Q15. Are athletes more popular than entertainers?
SELECT profession, ROUND(AVG(followers_millions), 2) AS avg_followers
FROM instagram_account
WHERE profession LIKE '%football%' 
   OR profession LIKE '%musician%'
   OR profession LIKE '%actor%'
   OR profession LIKE '%Cricketer%'
GROUP BY profession;

-- Q16. Percentage contribution of each profession to total followers
SELECT profession,
       ROUND(
           SUM(followers_millions) * 100.0 /
           (SELECT SUM(followers_millions) FROM instagram_account),
           2
       ) AS follower_percentage
FROM instagram_account
GROUP BY profession
ORDER BY follower_percentage DESC;

-- Q17. Percentage contribution of each country to total followers
SELECT country,
       ROUND(
           SUM(followers_millions) * 100.0 /
           (SELECT SUM(followers_millions) FROM instagram_account),
           2
       ) AS follower_percentage
FROM instagram_account
GROUP BY country
ORDER BY follower_percentage DESC;


select * from instagram_account
