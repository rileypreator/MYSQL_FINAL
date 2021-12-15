USE Formula1_Final;

-- Race statements
SELECT * FROM Race
WHERE race_type = "Grand_Prix";

UPDATE Race
SET race_type = "Sprint_Qualifying"
WHERE race_type = "Practice_1" OR race_type = "Practice_2";

DELETE FROM Race
WHERE location_id > 27;

-- Result statements

SELECT result_id AS 'Results for the Monaco Grand Prix' FROM Result
WHERE race_id = 1;

UPDATE Result
SET points = 3
WHERE points > 104;

DELETE FROM Result
WHERE position > 25;
-- Season_has_location statements
SELECT season_id, Count(season_id) FROM Season_has_Location
GROUP BY season_id;

UPDATE Season_has_Location
SET location_id = 2
WHERE location_id = 5;

DELETE FROM Season_has_Location
WHERE season_id > 100;

-- Location statements
SELECT name, location_id FROM Location
WHERE name LIKE "F%";

UPDATE Location
SET name = "French Grand Prix"
WHERE name LIKE "F%";

DELETE FROM Location
WHERE name LIKE "United%";

-- Team statements
SELECT team_name, team_points AS "Not enough points" FROM Team
WHERE team_points > 150;

UPDATE Team
SET team_points = 0
WHERE team_points < 150;

DELETE FROM Team WHERE team_id > 30;

-- Driver Statements
SELECT * from Driver
WHERE team_id = "1";

UPDATE Driver 
SET team_id = "20"
WHERE driver_id = "120";

DELETE FROM Driver
WHERE driver_points = 0;

-- Season_has_Team CRUD statements
SELECT * from Season_has_Team;

UPDATE Season_has_Team
SET season_id = "2017"
WHERE season_id = "2020";

DELETE FROM Season_has_Team
WHERE team_id = "2020";

-- Season CRUD statements
SELECT * from Season;

UPDATE Season
SET year = "2019"
WHERE season_id = 1;

DELETE FROM Season WHERE year = "2022";