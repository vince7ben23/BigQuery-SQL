-- ARRAY & STRUCT

-- create array type in a table
CREATE OR REPLACE TABLE
  example.arr_table (country STRING,
    city_name ARRAY<STRING> );

INSERT INTO
  example.arr_table(country, city_name)
VALUES
  ( 'USA', ['Seattle WA', 'New York', 'Los Angeles']);

INSERT INTO
  example.arr_table(country, city_name)
VALUES
  ('Taiwan', ['Taichung', 'Hsinchu', 'Taipei']);
  
  
--  array of struct
WITH example AS (
SELECT timestamp('2022-01-01', 'UTC') as timestamp,  
  [
    STRUCT('sensor1' as sensor_name, 0.005 as sensor_value), 
    STRUCT('sensor2' as sensor_name, 0.45 as sensor_value),
    STRUCT('sensor3' as sensor_name, 0.1111 as sensor_value)  
  ] AS sensor_colloection
)
SELECT * from example

--  array of struct, example 2
SELECT
  'sensor1' AS sensor_name,
  [ 
    STRUCT(TIMESTAMP('2022-01-01 00:00:02') AS timestamp,0.005 AS sensor_value),
    STRUCT(TIMESTAMP('2022-01-01 00:00:02') AS timestamp,0.005 AS sensor_value),
    STRUCT(TIMESTAMP('2022-01-01 00:00:02') AS timestamp,0.005 AS sensor_value) 
  ] AS sensor_record
  
-- how to use ARRAY_AGG
WITH
  sample AS (
  SELECT
    "Ben" AS name,
    "math" AS subject,
    80 AS score
  UNION ALL
  SELECT
    "Ben" AS name,
    "english" AS subject,
    60 AS score
  UNION ALL
  SELECT
    "Ben" AS name,
    "physics" AS subject,
    100 AS score )
SELECT
  name,
  ARRAY_AGG(score) AS score_arr,
  ARRAY_AGG(subject) AS subject_arr
FROM
  sample
GROUP BY
  name