use fsd;
UPDATE coaches
SET coaches.coach_level=coaches.coach_level+1
where coaches.first_name LIKE "A%" 
and (SELECT coach_id FROM players_coaches WHERE coach_id=id LIMIT 1);