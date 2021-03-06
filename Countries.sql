USE World;

SELECT a.name, b.language, b.percentage
FROM countries a JOIN languages b ON a.id = b.country_id
WHERE b.language = "Slovene"
ORDER BY b.percentage DESC;

SELECT a.name, COUNT(*) as cities
FROM countries a JOIN cities c ON a.id = c.country_id
GROUP BY a.name
ORDER BY count(*) desc;

SELECT c.name, c.population, c.country_id
FROM countries a JOIN cities c ON a.id = c.country_id
WHERE a.name="Mexico" and c.population>'500000'
ORDER BY c.population DESC;

SELECT a.name, b.language, b.percentage
FROM countries a JOIN languages b ON a.id = b.country_id
WHERE b.percentage>'89'
ORDER BY b.percentage DESC;

SELECT a.name, a.surface_area, a.population
FROM countries a
WHERE a.surface_area<'501' and a.population>'100000';

SELECT a.name, a.government_form, a.capital, a.life_expectancy
FROM countries a
WHERE a.government_form='Constitutional Monarchy' and a.capital>'200' and a.life_expectancy>'75';

SELECT a.name as country , c.name as city_name, c.district, c.population as population
FROM countries a JOIN cities c ON a.id=c.country_id
WHERE a.name='Argentina' and c.district='Buenos Aires' and c.population>'500000';

SELECT a.region, COUNT(*) AS countries
FROM countries a 
GROUP BY a.region
ORDER BY COUNT(*) DESC;