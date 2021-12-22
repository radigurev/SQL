CREATE DATABASE `stc`;
USE stc;

CREATE TABLE addresses(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL
);

CREATE TABLE clients(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drivers(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
age INTEGER NOT NULL,
rating FLOAT NOT NULL DEFAULT 5.5
);

CREATE TABLE cars(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
make VARCHAR(20) NOT NULL,
model VARCHAR(20),
`year` INTEGER DEFAULT 0 NOT NULL,
mileage INTEGER DEFAULT 0 ,
`condition` CHAR NOT NULL,
category_id INTEGER NOT NULL,
CONSTRAINT `fk_cars_category`
FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE courses(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
from_address_id INTEGER NOT NULL,
start DATETIME NOT NULL,
bill DECIMAL(10,2) DEFAULT 10,
car_id INTEGER NOT NULL,
client_id INTEGER NOT NULL,
CONSTRAINT `fk_courses_addresses`
FOREIGN KEY (from_address_id) REFERENCES addresses(id),
CONSTRAINT `fk_courses_cars`
FOREIGN KEY (car_id) REFERENCES cars(id),
CONSTRAINT `fk_courses_clients`
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE cars_drivers(
car_id INTEGER NOT NULL,
driver_id INTEGER NOT NULL,
CONSTRAINT `pk_cars_drivers`
PRIMARY KEY(car_id,driver_id),
CONSTRAINT `fk_cars_drivers_cars`
FOREIGN KEY (car_id) REFERENCES cars(id),
CONSTRAINT `fk_cars_drivers_drivers`
FOREIGN KEY (driver_id) REFERENCES drivers(id)
);