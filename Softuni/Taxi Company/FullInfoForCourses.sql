SELECT a.`name` AS `name`
,IF(CAST(`start` as time)>='06:00:00 AND'AND CAST(`start` as time)<='20:00:00' , "Day","Night") AS day_time
, co.bill AS bill, cl.full_name AS full_name, c.make AS make, c.model AS make,ca.`name` AS category_name FROM courses AS co
 JOIN addresses AS a ON co.from_address_id=a.id
 JOIN clients AS cl ON co.client_id=cl.id
 JOIN cars AS c ON c.id=co.car_id
 JOIN categories AS ca ON c.category_id=ca.id
ORDER BY co.id;
;
