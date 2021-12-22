DELETE FROM clients AS c
WHERE c.id NOT IN (SELECT client_id FROM courses);