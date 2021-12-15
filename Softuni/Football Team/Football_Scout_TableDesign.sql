CREATE DATABASE `fsd`;
USE fsd;

CREATE TABLE `players`(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
first_name varchar(10) NOT NULL,
last_name varchar(20) NOT NULL,
age INTEGER NOT NULL DEFAULT 0,
position CHARACTER(1) NOT NULL,
salary DECIMAL(10,2)NOT NULL DEFAULT 0,
hire_date DATETIME,
skills_data_id INTEGER NOT NULL,
team_id INTEGER
);
CREATE TABLE `players_coaches`(
player_id INTEGER,
coach_id INTEGER,
CONSTRAINT `pk_player_coaches`
PRIMARY KEY(player_id,coach_id)
);
CREATE TABLE `coaches`(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(20) NOT NULL,
salary DECIMAL(10,2) NOT NULL DEFAULT 0,
coach_level INTEGER NOT NULL DEFAULT 0
); 

CREATE TABLE `skills_data`(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
dribbling INT DEFAULT 0,
pace INT DEFAULT 0,
passing INT DEFAULT 0,
shooting INT DEFAULT 0,
speed INT DEFAULT 0,
strength INT DEFAULT 0
);

CREATE TABLE `teams`(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
`name` varchar(45) NOT NULL,
established DATE NOT NULL,
fan_base BIGINT NOT NULL DEFAULT 0,
stadium_id INTEGER NOT NULL
);

CREATE TABLE `stadiums`(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
capacity INTEGER NOT NULL,
town_id INTEGER NOT NULL
);

CREATE TABLE `towns`(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
country_id INTEGER NOT NULL
);

CREATE TABLE `countries`(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);

ALTER TABLE players
ADD CONSTRAINT `fk_players_skill_dates`
FOREIGN KEY(skills_data_id)
REFERENCES skills_data(id);

ALTER TABLE players
ADD CONSTRAINT `fk_players_teams`
FOREIGN KEY(team_id)
REFERENCES teams(id);

ALTER TABLE players_coaches
ADD CONSTRAINT `fk_ players_coaches_players`
FOREIGN KEY(player_id)
REFERENCES players(id);

ALTER TABLE players_coaches
ADD CONSTRAINT `fk_ players_coaches_coaches`
FOREIGN KEY(coach_id)
REFERENCES coaches(id);

ALTER TABLE teams
ADD CONSTRAINT `fk_ teams_stadiums`
FOREIGN KEY(stadium_id)
REFERENCES stadiums(id);

ALTER TABLE stadiums
ADD CONSTRAINT `fk_ stadium_towns`
FOREIGN KEY(town_id)
REFERENCES towns(id);

ALTER TABLE towns
ADD CONSTRAINT `fk_ towns_countries`
FOREIGN KEY(country_id)
REFERENCES countries(id);


