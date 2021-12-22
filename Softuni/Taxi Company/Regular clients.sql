SELECT c.full_name, COUNT(*) AS count_of_cars, SUM(co.bill) AS total_sum
FROM courses AS co
JOIN clients AS c ON co.client_id=c.id
WHERE c.full_name LIKE '_a%'
GROUP BY c.full_name
HAVING count_of_cars>1
ORDER BY c.full_name
;