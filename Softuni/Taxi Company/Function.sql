CREATE FUNCTION `udf_courses_by_client`(phone_num VARCHAR(20)) RETURNS int
    DETERMINISTIC
BEGIN
RETURN(
SELECT COUNT(c.id) FROM clients AS cl
JOIN courses AS c ON c.client_id=cl.id
WHERE cl.phone_number=phone_num
);
END