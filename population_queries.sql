-- This is the first query:

SELECT DISTINCT year from population_years;

-- Add your additional queries below:

--How many entries in the database are from Africa?
SELECT COUNT(*)
FROM  countries
WHERE continent = 'Africa';

--What was the total population of Oceania in 2005?
SELECT SUM(population) AS 'Population en Oceanie'
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE continent = 'Oceania' AND year =2005;
--32.66417

--What is the average population of countries in South America in 2003?

SELECT AVG(population) AS 'Moyenne Sud Amerique'
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE continent LIKE '%south%' AND year =2003;

--What country had the smallest population in 2007?
SELECT countries.name, MIN(population)
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE year =2007;
--Niue

--What is the average population of Poland during the time period covered by this dataset?
-- REP: 38.5606790909091
SELECT countries.name, AVG(population_years.population)
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE countries.name ='Poland';

--# How many countries have the word "The" in their name? REP: 33
SELECT COUNT(population_years.population) 
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE countries.name LIKE'%The%';

--#9
SELECT countries.continent,
SUM(population_years.population) as 'Total Population'
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE year = 2010
GROUP BY countries.continent
ORDER BY 1 ASC;
--continent	Total Population
--Africa	9972.25333
--Asia	43060.62809
--Europe	7991.48186
--North America	5643.75671000001
--Oceania	359.47808
--South America	4096.11401
