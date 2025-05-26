/* 2025-05-25 00:58:46 [45 ms] */ 
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL

);
/* 2025-05-25 00:58:46 [45 ms] */ 
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL

);
/* 2025-05-25 00:58:58 [9 ms] */ 
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);
/* 2025-05-25 00:58:58 [9 ms] */ 
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);
/* 2025-05-25 00:59:02 [12 ms] */ 
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER NOT NULL REFERENCES species(species_id),
    ranger_id INTEGER NOT NULL REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);
/* 2025-05-25 00:59:02 [12 ms] */ 
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER NOT NULL REFERENCES species(species_id),
    ranger_id INTEGER NOT NULL REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);
/* 2025-05-25 01:03:00 [4 ms] */ 
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');
/* 2025-05-25 01:03:00 [4 ms] */ 
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');
/* 2025-05-25 01:04:41 [1 ms] */ 
SELECT * from rangers LIMIT 100;
/* 2025-05-25 01:04:41 [1 ms] */ 
SELECT * from rangers LIMIT 100;
/* 2025-05-25 01:05:25 [3 ms] */ 
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
/* 2025-05-25 01:05:25 [3 ms] */ 
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
/* 2025-05-25 01:08:22 [11 ms] */ 
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
( 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
( 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
( 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
( 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);
/* 2025-05-25 01:08:22 [11 ms] */ 
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
( 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
( 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
( 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
( 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);
/* 2025-05-25 01:08:40 [8 ms] */ 
select * from sightings LIMIT 100;
/* 2025-05-25 01:08:40 [8 ms] */ 
select * from sightings LIMIT 100;
/* 2025-05-25 01:30:19 [7 ms] */ 
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
/* 2025-05-25 01:30:19 [7 ms] */ 
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
/* 2025-05-25 01:30:44 [2 ms] */ 
SELECT * FROM rangers WHERE name = 'Derek Fox' LIMIT 100;
/* 2025-05-25 01:30:44 [2 ms] */ 
SELECT * FROM rangers WHERE name = 'Derek Fox' LIMIT 100;
/* 2025-05-25 01:30:55 [1 ms] */ 
SELECT * FROM rangers LIMIT 100;
/* 2025-05-25 01:30:55 [1 ms] */ 
SELECT * FROM rangers LIMIT 100;
/* 2025-05-25 01:34:30 [10 ms] */ 
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings LIMIT 100;
/* 2025-05-25 01:34:30 [10 ms] */ 
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings LIMIT 100;
/* 2025-05-25 01:35:35 [2 ms] */ 
SELECT *
FROM sightings
WHERE location ILIKE '%Pass%' LIMIT 100;
/* 2025-05-25 01:35:35 [2 ms] */ 
SELECT *
FROM sightings
WHERE location ILIKE '%Pass%' LIMIT 100;
/* 2025-05-25 01:43:04 [34 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-25 01:43:04 [34 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-25 01:45:51 [3 ms] */ 
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.sighting_id IS NULL LIMIT 100;
/* 2025-05-25 01:45:51 [3 ms] */ 
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.sighting_id IS NULL LIMIT 100;
/* 2025-05-25 01:47:29 [6 ms] */ 
SELECT *
FROM sightings
ORDER BY sighting_time DESC
LIMIT 2;
/* 2025-05-25 01:47:29 [6 ms] */ 
SELECT *
FROM sightings
ORDER BY sighting_time DESC
LIMIT 2;
/* 2025-05-25 01:48:15 [1 ms] */ 
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;
/* 2025-05-25 01:48:15 [1 ms] */ 
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;
/* 2025-05-25 01:49:20 [4 ms] */ 
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';
/* 2025-05-25 01:49:20 [4 ms] */ 
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';
/* 2025-05-25 01:50:25 [2 ms] */ 
SELECT * FROM species LIMIT 100;
/* 2025-05-25 01:50:25 [2 ms] */ 
SELECT * FROM species LIMIT 100;
/* 2025-05-25 01:52:19 [3 ms] */ 
SELECT
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings LIMIT 100;
/* 2025-05-25 01:52:19 [3 ms] */ 
SELECT
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings LIMIT 100;
/* 2025-05-25 01:53:04 [6 ms] */ 
DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);
/* 2025-05-25 01:53:04 [6 ms] */ 
DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);
/* 2025-05-25 01:54:39 [1 ms] */ 
SELECT * from rangers LIMIT 100;
/* 2025-05-25 01:54:39 [1 ms] */ 
SELECT * from rangers LIMIT 100;
/* 2025-05-25 05:12:36 [161 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-25 05:12:36 [161 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-26 08:07:24 [44 ms] */ 
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
/* 2025-05-26 08:07:24 [44 ms] */ 
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
/* 2025-05-26 08:08:22 [18 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-26 08:08:22 [18 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-26 08:08:55 [10 ms] */ 
SELECT * from species LIMIT 100;
/* 2025-05-26 08:08:55 [10 ms] */ 
SELECT * from species LIMIT 100;
/* 2025-05-26 08:09:43 [6 ms] */ 
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
/* 2025-05-26 08:09:43 [6 ms] */ 
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
/* 2025-05-26 08:10:40 [2 ms] */ 
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings LIMIT 100;
/* 2025-05-26 08:10:40 [2 ms] */ 
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings LIMIT 100;
/* 2025-05-26 08:17:33 [1 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-26 08:17:33 [1 ms] */ 
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name LIMIT 100;
/* 2025-05-26 08:25:07 [2 ms] */ 
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.sighting_id IS NULL LIMIT 100;
/* 2025-05-26 08:25:07 [2 ms] */ 
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.sighting_id IS NULL LIMIT 100;
