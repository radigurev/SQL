USE stc;
INSERT INTO clients(full_name,phone_number) 
SELECT concat(d.first_name, " ",d.last_name), CONCAT("(088) 9999",d.id*2)
FROM drivers AS d
where  id>=10 AND id<=20;