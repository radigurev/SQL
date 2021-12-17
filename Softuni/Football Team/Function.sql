CREATE FUNCTION `udf_stadium_players_count` (stadium_name varchar(30))
RETURNS INTEGER
BEGIN
RETURN (SELECT COUNT(p.id)
FROM players AS p
RIGHT JOIN teams AS t ON p.team_id=t.id
RIGHT JOIN stadiums AS s ON t.stadium_id=s.id
WHERE s.name = stadium_name);
END