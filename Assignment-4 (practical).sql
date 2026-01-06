use world;

select * from country;
select * from countrylanguage;
select * from city;

## Q. Count how many cities are there in each country.
select country_name,
count(city_name) as no_of_cities
from city as ct
inner join country as c
on ct.id=c.id
group by country_name;

## Q. Display all continents having more than 30 countries.
select continent,
count(country_name) as no_of_countries
from country
group by continent
having count(country_name)>30;

## Q.list Region whose total populatioon exceeds 200 million.
select region,
sum(country_pop) as total_pop
 from country
group by region
having sum(country_pop)>200000000;

## Q. find the top 5 countries by average gnp by country.
select country_name,gnp
from country
where gnp >(select avg(gnp) from country)
order by gnp desc
limit 5;

## Q. find the total no of official language spoken in each continent.
select continent,count(language) as official_language
from country c 
inner join countrylanguage cl
on c.id=cl.countrycode
where cl.isofficial="T"
group by continent;

## Q. find minimum and maximum gnp for each continent.
select continent,
max(gnp) as maximum_gnp,
min(gnp) as minimum_gnp
from country
group by continent;

## Q. find the country with highest average city population.
select distinct country_name,country_pop
from country c
inner join city ct
on c.id=ct.id
where country_pop > (select avg(city_pop) from city);

## Q. list continents where the avearge city population is greater than 200000.
select  continent,
avg(city_pop) as average_city_population
from  country c 
inner join city ct
on ct.id=c.id
group by continent
having average_city_population>200000;

## Q. find the total population and average life expectancy for each continent ordered by average life expectancy descending.
select continent,
avg(lifeexpectancy) as average_life_expectancy,
sum(country_pop) as total_population
from country
group by continent
order by average_life_expectancy desc;

## Q. find the top 3 continents with the higest average life expectancy but only include those where the total population is over 200 million.
select continent,
avg(lifeexpectancy) as average_life_expectancy
from country
group by continent
having sum(country_pop)>20000000
limit 3;