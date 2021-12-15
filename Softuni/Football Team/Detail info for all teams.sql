SELECT t.name, t.established, t.fan_base,COUNT(p.id) AS players_count
FROM players AS p
JOIN teams AS t
ON p.team_id=t.id
GROUP BY t.id
ORDER BY players_count DESC, t.fan_base DESC;

SELECT t.name, t.established, t.fan_base, (SELECT COUNT(*) FROM players WHERE team_id=t.id) AS players_count
FROM teams AS t
ORDER BY players_count DESC, fan_base DESC;