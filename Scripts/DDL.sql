create database airline_flight_delays;
use airline_flight_delays;

-- ------------------------ Create Tables-------------------------------

CREATE TABLE flights (
  YEAR INT,
  MONTH INT,
  DAY INT,
  DAY_OF_WEEK INT,
  AIRLINE VARCHAR(10),
  FLIGHT_NUMBER INT,
  TAIL_NUMBER VARCHAR(20),
  ORIGIN_AIRPORT VARCHAR(10),
  DESTINATION_AIRPORT VARCHAR(10),
  SCHEDULED_DEPARTURE INT,
  DEPARTURE_TIME INT,
  DEPARTURE_DELAY INT,
  TAXI_OUT INT,
  WHEELS_OFF INT,
  SCHEDULED_TIME INT,
  ELAPSED_TIME INT,
  AIR_TIME INT,
  DISTANCE INT,
  WHEELS_ON INT,
  TAXI_IN INT,
  SCHEDULED_ARRIVAL INT,
  ARRIVAL_TIME INT,
  ARRIVAL_DELAY INT,
  DIVERTED TINYINT,
  CANCELLED TINYINT,
  CANCELLATION_REASON VARCHAR(5),
  AIR_SYSTEM_DELAY INT,
  SECURITY_DELAY INT,
  AIRLINE_DELAY INT,
  LATE_AIRCRAFT_DELAY INT,
  WEATHER_DELAY INT
);

CREATE TABLE airports (
    IATA_CODE CHAR(3) PRIMARY KEY,
    AIRPORT VARCHAR(100),
    CITY VARCHAR(100),
    STATE CHAR(2),
    COUNTRY VARCHAR(50),
    LATITUDE DECIMAL(9,5),
    LONGITUDE DECIMAL(9,5)
);

create table cancellation_codes(
	CANCELLATION_REASON varchar(5),
    CANCELLATION_DESCRIPTION varchar(20)
);

CREATE TABLE airlines (
    IATA_CODE CHAR(2) PRIMARY KEY,
    AIRLINE VARCHAR(100)
);


-- airports Bulk insert
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/airports.csv'
INTO TABLE airports
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- cancellation_codes insertion
INSERT INTO cancellation_codes (CANCELLATION_REASON, CANCELLATION_DESCRIPTION)
VALUES 
('A', 'Airline/Carrier'),
('B', 'Weather'),
('C', 'National Air System'),
('D', 'Security');


-- airlines_insertion
INSERT INTO airlines (IATA_CODE, AIRLINE)
VALUES
    ('UA', 'United Air Lines Inc.'),
    ('AA', 'American Airlines Inc.'),
    ('US', 'US Airways Inc.'),
    ('F9', 'Frontier Airlines Inc.'),
    ('B6', 'JetBlue Airways'),
    ('OO', 'Skywest Airlines Inc.'),
    ('AS', 'Alaska Airlines Inc.'),
    ('NK', 'Spirit Air Lines'),
    ('WN', 'Southwest Airlines Co.'),
    ('DL', 'Delta Air Lines Inc.'),
    ('EV', 'Atlantic Southeast Airlines'),
    ('HA', 'Hawaiian Airlines Inc.'),
    ('MQ', 'American Eagle Airlines Inc.'),
    ('VX', 'Virgin America');

