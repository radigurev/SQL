use fsd;
SELECT c.name, COUNT(p.id) AS total_count_of_players, SUM(salary) AS total_sum_of_salaries
FROM players AS p
RIGHT JOIN teams AS t ON p.team_id=t.id
RIGHT JOIN stadiums AS s ON t.stadium_id=s.id
RIGHT JOIN towns AS tw ON s.town_id=tw.id
RIGHT JOIN countries AS c ON tw.country_id=c.id
GROUP BY c.`name`
ORDER BY total_count_of_players DESC, c.`name`;