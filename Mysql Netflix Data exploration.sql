select *
from netflix;
-- Cleaning the data
-- Checking for any dublicates

select *, row_number() over(partition by title, genre, `language`, imdb_score, premiere, runtime, `year`)
from netflix;

with net_temp as 
(select *, row_number() over(partition by title, genre, `language`, imdb_score, premiere, runtime, `year`) as row_num
from netflix)

select *
from net_temp
where row_num = 1;

-- No dublicates found

select *
from netflix;

update netflix
set title = 'Realityhigh'
where title like '%realityhi%';


alter table netflix
change premiere  premiere_date Varchar(50);

select premiere_date, str_to_date(premiere_date, '%m/%d/%Y') as premiere_date
FROM netflix;

update netflix
set premiere_date = str_to_date(premiere_date, '%m/%d/%Y');

-- Data Exploration

Select *
from netflix
order by imdb_score desc;

-- Top rated movies for each year 

Select *, row_number() over(partition by `year` order by imdb_score desc)
from netflix