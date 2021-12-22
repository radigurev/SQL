SELECT d.first_name, d.last_name, c.make, c.model, c.mileage 
FROM drivers AS d
 JOIN cars_drivers ON d.id=cars_drivers.driver_id
 JOIN cars AS c  ON cars_drivers.car_id=c.id
WHERE c.mileage IS NOT NULL
ORDER BY c.mileage DESC, d.first_name;