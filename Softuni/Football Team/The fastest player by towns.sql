SELECT MAX(sd.speed) AS max_speed,tw.`name`
FROM players AS p
RIGHT JOIN skills_data AS sd ON p.skills_data_id=sd.id
RIGHT JOIN teams as t ON p.team_id=t.id
RIGHT JOIN stadiums as s ON t.stadium_id=s.id
RIGHT JOIN towns as tw ON s.town_id=tw.id
WHERE t.`name`!="Devify"
GROUP BY tw.`name`
ORDER BY max_speed DESC, tw.`name` ASC;

