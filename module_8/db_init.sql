/*
    Mod 8.2 tables  
   natasha jeter
    Feb 28, 2023
    
*/

 
DROP USER IF EXISTS 'pysports_user'@'localhost';



CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

 
GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost';


DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;
 
CREATE TABLE team (
    team_id     INT             NOT NULL        AUTO_INCREMENT,
    team_name   VARCHAR(75)     NOT NULL,
    mascot      VARCHAR(75)     NOT NULL,
    PRIMARY KEY(team_id)
); 

CREATE TABLE player (
    player_id   INT             NOT NULL        AUTO_INCREMENT,
    first_name  VARCHAR(75)     NOT NULL,
    last_name   VARCHAR(75)     NOT NULL,
    team_id     INT             NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team 
    FOREIGN KEY(team_id)
        REFERENCES team(team_id)
);



INSERT INTO team(team_name, mascot)
    VALUES('Team Coffee', 'The Mugs');

INSERT INTO team(team_name, mascot)
    VALUES('Hot Tea', 'The Kettles');


-- insert player records 
INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Midnight', 'Roast', (SELECT team_id FROM team WHERE team_name = 'Team Coffee'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Breakfast', 'Blend', (SELECT team_id FROM team WHERE team_name = 'Team Coffee'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Iced', 'Latte', (SELECT team_id FROM team WHERE team_name = 'Team Coffee'));

INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Vanilla', 'Chai', (SELECT team_id FROM team WHERE team_name = 'Team Hot Tea'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Jasmine', 'Green', (SELECT team_id FROM team WHERE team_name = 'Team Hot Tea'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Azog', 'The Defiler', (SELECT team_id FROM team WHERE team_name = 'Team Hot Tea'));



    