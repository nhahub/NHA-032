-- =========================
-- AIRLINES: PROFILING & CHECKS
-- =========================

-- Null / duplicate check for airline codes & names
SELECT 
    COUNT(*) AS total_rows,
    SUM(IATA_CODE IS NULL OR IATA_CODE = '')      AS null_iata_code,
    COUNT(DISTINCT IATA_CODE)                     AS distinct_iata_code,
    COUNT(*) - COUNT(DISTINCT IATA_CODE)          AS duplicate_iata_code,
    SUM(AIRLINE IS NULL OR AIRLINE = '')          AS null_airline_name
FROM airlines;

-- List duplicate IATA codes
SELECT 
    IATA_CODE,
    COUNT(*) AS cnt
FROM airlines
GROUP BY IATA_CODE
HAVING COUNT(*) > 1;

-- Airlines with missing names
SELECT *
FROM airlines
WHERE AIRLINE IS NULL OR AIRLINE = '';





-- =========================
-- AIRPORTS: PROFILING & CHECKS
-- =========================

-- Null / duplicate check
SELECT 
    COUNT(*) AS total_rows,
    SUM(IATA_CODE IS NULL OR IATA_CODE = '') AS null_iata_code,
    COUNT(DISTINCT IATA_CODE)               AS distinct_iata_code,
    COUNT(*) - COUNT(DISTINCT IATA_CODE)    AS duplicate_iata_code,
    SUM(AIRPORT IS NULL OR AIRPORT = '')    AS null_airport_name,
    SUM(CITY IS NULL OR CITY = '')          AS null_city,
    SUM(STATE IS NULL OR STATE = '')        AS null_state,
    SUM(COUNTRY IS NULL OR COUNTRY = '')    AS null_country
FROM airports;

-- Duplicate airport codes
SELECT IATA_CODE, COUNT(*) AS cnt
FROM airports
GROUP BY IATA_CODE
HAVING COUNT(*) > 1;

-- Latitude / longitude range check (LAT: -90 to 90, LONG: -180 to 180)
SELECT *
FROM airports
WHERE LATITUDE IS NULL
   OR LONGITUDE IS NULL
   OR LATITUDE  < -90  OR LATITUDE  > 90
   OR LONGITUDE < -180 OR LONGITUDE > 180;

-- Suspicious STATE codes (not 2 uppercase letters)
SELECT DISTINCT STATE
FROM airports
WHERE STATE IS NOT NULL
  AND STATE <> ''
  AND (LENGTH(STATE) <> 2 OR STATE <> UPPER(STATE));



-- Date fields: YEAR, MONTH, DAY, DAY_OF_WEEK
-- Basic nulls and invalid ranges
SELECT 
    COUNT(*) AS total_rows,
    SUM(YEAR IS NULL)           AS null_year,
    SUM(MONTH IS NULL)          AS null_month,
    SUM(DAY IS NULL)            AS null_day,
    SUM(DAY_OF_WEEK IS NULL)    AS null_day_of_week,
    SUM(MONTH < 1 OR MONTH > 12)        AS invalid_month,
    SUM(DAY   < 1 OR DAY   > 31)        AS invalid_day,
    SUM(DAY_OF_WEEK < 1 OR DAY_OF_WEEK > 7) AS invalid_dow
FROM flights;



-- Referential integrity for codes
-- Flights with airline code not found in airlines
SELECT f.*
FROM flights f
LEFT JOIN airlines a
  ON f.AIRLINE = a.IATA_CODE
WHERE a.IATA_CODE IS NULL;

-- Flights with origin airport not found in airports
SELECT f.*
FROM flights f
LEFT JOIN airports ap
  ON f.ORIGIN_AIRPORT = ap.IATA_CODE
WHERE ap.IATA_CODE IS NULL;

-- Flights with destination airport not found in airports
SELECT f.*
FROM flights f
LEFT JOIN airports ap
  ON f.DESTINATION_AIRPORT = ap.IATA_CODE
WHERE ap.IATA_CODE IS NULL;




-- --------------Delays and durations – negative or impossible values-----------------------------
-- Delays should not be negative according to the dictionary notes
SELECT *
FROM flights
WHERE DEPARTURE_DELAY < 0
   OR ARRIVAL_DELAY < 0
   OR TAXI_OUT < 0
   OR TAXI_IN  < 0
   OR SCHEDULED_TIME < 0
   OR ELAPSED_TIME   < 0
   OR AIR_TIME       < 0
   OR DISTANCE       <= 0;   -- distance should be positive

-- Logical consistency: if CANCELLED=1 then ARRIVAL_TIME / ARRIVAL_DELAY / AIR_TIME should usually be NULL or 0
SELECT *
FROM flights
WHERE CANCELLED = 1
  AND (
        ARRIVAL_TIME IS NOT NULL
     OR ARRIVAL_DELAY IS NOT NULL
     OR AIR_TIME IS NOT NULL
      );

-- For non-cancelled flights, ARRIVAL_DELAY should exist
SELECT *
FROM flights
WHERE CANCELLED = 0
  AND ARRIVAL_DELAY IS NULL;
  
  
  -- -----------------------Flags: DIVERTED, CANCELLED -------------------------------
  -- Check DIVERTED and CANCELLED are only 0 or 1
SELECT *
FROM flights
WHERE DIVERTED NOT IN (0,1)
   OR DIVERTED IS NULL;

SELECT *
FROM flights
WHERE CANCELLED NOT IN (0,1)
   OR CANCELLED IS NULL;
   
   
   
   
   
-- Delay component columns should be >= 0 or NULL (dictionary suggests treating NULL as 0)
   SELECT *
FROM flights
WHERE AIR_SYSTEM_DELAY     < 0
   OR SECURITY_DELAY       < 0
   OR AIRLINE_DELAY        < 0
   OR LATE_AIRCRAFT_DELAY  < 0
   OR WEATHER_DELAY        < 0;
   
   
   
   
   
   
   
   
   
-- =========================
-- CANCELLATION CODES
-- =========================

-- Uniqueness and null checks
SELECT 
    COUNT(*) AS total_rows,
    SUM(CANCELLATION_REASON IS NULL OR CANCELLATION_REASON = '') AS null_reason_code,
    COUNT(DISTINCT CANCELLATION_REASON) AS distinct_reason_code,
    COUNT(*) - COUNT(DISTINCT CANCELLATION_REASON) AS duplicate_reason_code,
    SUM(CANCELLATION_DESCRIPTION IS NULL OR CANCELLATION_DESCRIPTION = '') AS null_description
FROM cancellation_codes;

-- Find duplicate reason codes
SELECT CANCELLATION_REASON, COUNT(*) AS cnt
FROM cancellation_codes
GROUP BY CANCELLATION_REASON
HAVING COUNT(*) > 1;







-- Check flights referencing unknown reason codes (dictionary says codes A/B/C/D):
SELECT DISTINCT CANCELLATION_REASON
FROM flights
WHERE CANCELLATION_REASON IS NOT NULL
  AND CANCELLATION_REASON NOT IN ('A','B','C','D');




