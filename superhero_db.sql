create database superheroes_db;

USE superheroes_db;

show tables;

# Modifying Data tables

SELECT * FROM superheroes_db.heroes_info;
describe heroes_info;

ALTER TABLE heroes_info
MODIFY name varchar(50);

ALTER TABLE heroes_info
ADD FOREIGN KEY (name) REFERENCES hero_name_primary(hero_name_primary);

SELECT * FROM superheroes_db.super_hero_powers;
describe super_hero_powers;

ALTER TABLE super_hero_powers
MODIFY hero_names varchar(50);

ALTER TABLE super_hero_powers
ADD FOREIGN KEY (hero_names) REFERENCES hero_name_primary(hero_name_primary);

SELECT * FROM superheroes_db.superheroes;
describe superheroes;

ALTER TABLE superheroes
ADD FOREIGN KEY (name) REFERENCES hero_name_primary(hero_name_primary);

SELECT * FROM superheroes_db.movies_with_characters;

ALTER TABLE movies_with_characters
MODIFY movie_title varchar(50);

ALTER TABLE movies_with_characters
ADD FOREIGN KEY (movie_title) REFERENCES superhero_movie_db(Title);

ALTER TABLE movies_with_characters
MODIFY character_name varchar(50);

ALTER TABLE movies_with_characters
ADD FOREIGN KEY (character_name) REFERENCES hero_name_primary(hero_name_primary);

SELECT * FROM superheroes_db.superhero_movie_db;
describe superhero_movie_db;

ALTER TABLE superhero_movie_db
MODIFY Title varchar(50);

ALTER TABLE superhero_movie_db
ADD PRIMARY KEY (Title);

SELECT * FROM superheroes_db.hero_name_primary;

ALTER TABLE hero_name_primary
MODIFY hero_name_primary varchar(50);

ALTER TABLE hero_name_primary
ADD PRIMARY KEY (hero_name_primary);


-- General Information:

-- Q1 What are the names,publisher of all the superheroes who has good alignment in the dataset heroes_info ?

select 
	name, publisher
from 
	heroes_info
where 
	alignment = 'good'
order by 
	name asc,publisher desc;

-- Q2 provide count of each supercharacter on the basis of publisher and its alignment?

select 
	publisher,alignment,count(name) as count_of_supes
from 
	heroes_info
group by 
	publisher,alignment
order by 
	count_of_supes Desc,publisher,alignment;
 
-- Q3 How many superheroes have powers related to telepathy and which publisher they belong?

select 
	hero_names,publisher 
from 
	super_hero_powers
left join 
	heroes_info
on 
	heroes_info.name = super_hero_powers.hero_names
where 
	telepathy = 'True'
order by 
	hero_names ;
    
-- Q4 show the count of supes on the basis of previous question requirement group them by publisher & gender?

select 
	publisher,gender, count(hero_names) as count_of_telepaths
from 
	super_hero_powers
left join 
	heroes_info
on 
	heroes_info.name = super_hero_powers.hero_names
where 
	telepathy = 'True'
group by
	publisher,gender
having 
	publisher is not null
order by 
	count_of_telepaths desc ,publisher,gender ;
    
-- Q5 from above data in marvel comics publisher what are the alignment of telepaths,their full name and first appearance in comics?

select 
	heroes_info.name,heroes_info.alignment,`Full-Name`,`First-Appearance`
from 
	super_hero_powers
left join 
	heroes_info
on 
	heroes_info.name = super_hero_powers.hero_names
left join
	superheroes
on 
	superheroes.name = heroes_info.name
where 
	telepathy = 'True' and heroes_info.publisher = 'Marvel Comics'
;

-- Q6 for above data find name of superheroes that appeared in movies and its lifetime collection(earnings)?

select 
	heroes_info.name,heroes_info.alignment,movie_title,`Lifetime Gross /Theaters`
    
from 
	super_hero_powers
left join 
	heroes_info
on 
	heroes_info.name = super_hero_powers.hero_names
join
	movies_with_characters
on 
	movies_with_characters.character_name = heroes_info.name
join
	superhero_movie_db
on
	superhero_movie_db.Title = movies_with_characters.movie_title
where 
	telepathy = 'True' and heroes_info.publisher = 'Marvel Comics';
    

-- Q7 Which superhero has the most movies in the dataset?

select 
	character_name,count(character_name) as count_of_appearance
from 
	movies_with_characters
group by 
	character_name
order by 
	count_of_appearance desc;

-- Q8 Which superhero has collective highest boxoffice gross earning?

select 
	character_name,sum(`Lifetime Gross /Theaters`) as sum_of_earnings
from 
	movies_with_characters
join 
	superhero_movie_db
on
	superhero_movie_db.Title = movies_with_characters.character_name
group by 
	character_name
order by 
	sum_of_earnings desc;

-- Q9 List the count of movie released before & after year 2010 ,also total Earning collection made.

SELECT
(SELECT 
	count(title)
 --    sum(`Lifetime Gross /Theaters`) as total_earning_before_2010
FROM
    superhero_movie_db
WHERE
    year(date) <= 2010) as 'no_of_movies_before_2010' ,
(SELECT 
	sum(`Lifetime Gross /Theaters`)
 --    sum(`Lifetime Gross /Theaters`) as total_earning_before_2010
FROM
    superhero_movie_db
WHERE
    year(date) <= 2010) as 'sum_of_collection_before_2010' ,    
(SELECT 
	count(title) 
--     sum(`Lifetime Gross /Theaters`) as total_earning_before_2010
FROM
    superhero_movie_db
WHERE
    year(date) > 2010) as no_of_movies_after_2010 ,
(SELECT 
	sum(`Lifetime Gross /Theaters`) 
--     sum(`Lifetime Gross /Theaters`) as total_earning_before_2010
FROM
    superhero_movie_db
WHERE
    year(date) > 2010) as sum_of_collection_after_2010 ;
    



-- Q10 top 10 list of superhero have most set of superpower, publisher name , first appearance,race,alignment,?

select 
	hero_names,count_of_powers,publisher,race,`First-Appearance`Alignment
FROM
	super_hero_powers
join 
	superheroes 
on 
	superheroes.name = super_hero_powers.hero_names
ORDER BY 
	count_of_powers DESC
limit 10;
    
-- Q11 How many superheroes have appeared in movies released before And after 2010?

select (
select 
	count(distinct(character_name))
from 
	movies_with_characters
where 
	year(movie_year) > 2010 ) as distict_supes_after_2010,
(
select 
	count(distinct(character_name))
from 
	movies_with_characters
where 
	year(movie_year) <= 2010 ) as distict_supes_before_2010;
    
    
-- Q12 count of superheroes who appeared before 2010 but not appeared after 2010 and superheroes that appeared in before and after 2010?
select (select 
	count(character_name)
    from 
	movies_with_characters
where 
	year(movie_year) <= 2010 AND character_name NOT IN
    (select 
	character_name
from 
	movies_with_characters
where 
	year(movie_year) > 2010)) as supes_before_2010,
    (select 
	count(character_name)
    from 
	movies_with_characters
where 
	year(movie_year) <= 2010 AND character_name IN
    (select 
	character_name
from 
	movies_with_characters
where 
	year(movie_year) > 2010)) as supes_all_time;

-- Q13 which studio have highest total grossing box office collection?

select 
	studio,sum(`Lifetime Gross /Theaters`) as total_gross_earnings
from 
	superhero_movie_db
group by 
	studio
order by
	total_gross_earnings desc;


-- Movies Information:

-- Q14 Find the release dates of movies featuring batman and total no of theaters run & earnings.

select 
	Title,`Lifetime Gross /Theaters`,`Opening /Theaters`,DATE
from 
	movies_with_characters
join 
	superhero_movie_db
on
	superhero_movie_db.Title =movies_with_characters.movie_title
where 
	character_name = "Batman"
order by
	date ;

-- Q15 Find movies where a superhero has the power of invisibility and its gross_earnings.

select 
	hero_names,movie_title,`Lifetime Gross /Theaters`,DATE
from 
	super_hero_powers
join 
	movies_with_characters
on 
	movies_with_characters.character_name = super_hero_powers.hero_names
join
	superhero_movie_db
on
	movies_with_characters.movie_title = superhero_movie_db.Title
where 
	Invisibility = "TRUE" ;


-- Q16 Identify the most recent movie for each superhero.


SELECT character_name, movie_title, movie_year
FROM (
    SELECT 
        character_name, 
        movie_title, 
        movie_year,
        ROW_NUMBER() OVER (PARTITION BY character_name ORDER BY movie_year DESC) AS row_num
    FROM movies_with_characters
) AS ranked
WHERE row_num = 1;

-- another method

SELECT character_name, movie_title, movie_year
FROM (
    SELECT 
        character_name, 
        movie_title, 
        movie_year,
        RANK() OVER (PARTITION BY character_name ORDER BY movie_year DESC) AS rank_num
    FROM movies_with_characters
) AS ranked
WHERE rank_num = 1;

-- Q17 find character have Group-Affiliation to Agents of S.H.I.E.L.D.?

select 
	Name,publisher,`Group-Affiliation`
from 
	superheroes
where 
	`Group-Affiliation` like "%Shield%" or  
	`Group-Affiliation` like "%S.h.i.e.l.d.%";
    
 
-- Q17 Find distinct races in the dataset and its count?
select 
	distinct(Race),count(race) as count_of_race
from 
	heroes_info
where 
	Publisher like "%marvel%"
group by 
	race
having 
	race is not null
order by
	count_of_race desc;    
    
-- Q19 list of mutant that appeared in movies?

select 
	character_name,movie_title
from
	movies_with_characters
join
	heroes_info
on
	heroes_info.name = movies_with_characters.character_name
where
	Race = "Mutant" ;




