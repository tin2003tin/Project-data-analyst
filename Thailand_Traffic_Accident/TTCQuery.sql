select *
from ThailandTrafficAccident..Thai_traffic_accidents

-- 816735 accidents
-- acc_code unqiue
-- incident_datetime date
-- report_datetime date
-- province_th 78 
-- province_en 78
-- agency 3
-- route unique
-- vehicle_type 15
-- presumed_cause 54
-- accident_type 11 
-- number_of_vehicle_involved int
-- number_of_fatalites int
-- number_of_injuries int
-- weather_condition 7
-- latitude float
-- longtitude float 
-- road_description 19
-- slope_description 3

-- ranking the provinces in Thailand based on the total number of accidents
select province_th, COUNT(province_th) as total_accident
from ThailandTrafficAccident..Thai_traffic_accidents 
group by province_th
order by COUNT(province_th) desc

-- ranking the agency in Thailand based on the total number of agencies
select agency, COUNT(agency) as total_agency
from ThailandTrafficAccident..Thai_traffic_accidents
group by agency 
order by COUNT(agency) desc

-- ranking the roads in Thailand based on the total number of accidents
select route, COUNT(route) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by route
order by COUNT(route) desc

-- ranking the vehicle_type in Thailand based on the total number of accidents
select vehicle_type, COUNT(vehicle_type) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by vehicle_type
order by COUNT(vehicle_type) desc

-- ranking the presumed_cause in Thailand based on the total number of accidents
select  presumed_cause, COUNT( presumed_cause) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by  presumed_cause
order by COUNT( presumed_cause) desc

-- ranking the accident_type in Thailand based on the total number of accidents
select  accident_type, COUNT( accident_type) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by  accident_type
order by COUNT( accident_type) desc

-- ranking the number_of_vehicles_involved in Thailand
select *
from ThailandTrafficAccident..Thai_traffic_accidents
order by number_of_vehicles_involved desc

-- ranking the number_of_fatalities in Thailand
select *
from ThailandTrafficAccident..Thai_traffic_accidents
order by number_of_fatalities desc

-- ranking the number_of_injuries in Thailand
select *
from ThailandTrafficAccident..Thai_traffic_accidents
order by number_of_injuries desc

-- ranking the weather_condition in Thailand based on the total number of accidents
select  weather_condition, COUNT(weather_condition) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by  weather_condition
order by COUNT(weather_condition) desc

-- ranking the road_description in Thailand based on the total number of accidents
select  road_description, COUNT(road_description) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by  road_description
order by COUNT(road_description) desc

-- ranking the slope_description in Thailand based on the total number of accidents
select  slope_description, COUNT(slope_description) as total_accidents
from ThailandTrafficAccident..Thai_traffic_accidents
group by  slope_description
order by COUNT(slope_description) desc

-- show only the road with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
     province_th,
    route,
    COUNT(route) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(route) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY route, province_th
)
SELECT province_th, route,  total_accident
FROM RankedAccidents
WHERE rnk = 1 
order by province_th

-- show only the vehicle_type with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
    vehicle_type,
    province_th,
    COUNT(vehicle_type) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(vehicle_type) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY vehicle_type, province_th
)
SELECT province_th, vehicle_type, total_accident
FROM RankedAccidents
WHERE rnk = 1;



-- show only the presumed_cause with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
    presumed_cause,
    province_th,
    COUNT(presumed_cause) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(presumed_cause) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY presumed_cause, province_th
)
SELECT province_th, presumed_cause,  total_accident
FROM RankedAccidents
WHERE rnk = 1;

-- show only the accident_type with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
    accident_type,
    province_th,
    COUNT(accident_type) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(accident_type) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY accident_type, province_th
)
SELECT province_th,  accident_type, total_accident
FROM RankedAccidents
WHERE rnk = 1;

-- show only the weather_condition with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
    weather_condition,
    province_th,
    COUNT(weather_condition) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(weather_condition) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY weather_condition, province_th
)
SELECT  province_th, weather_condition, total_accident
FROM RankedAccidents
WHERE rnk = 1;


-- show only the road_description with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
    road_description,
    province_th,
    COUNT(road_description) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(road_description) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY road_description, province_th
)
SELECT province_th, road_description,  total_accident
FROM RankedAccidents
WHERE rnk = 1;


-- show only the slope_description with the highest total accidents for each province
WITH RankedAccidents AS (
  SELECT
    slope_description,
    province_th,
    COUNT(slope_description) as total_accident,
    ROW_NUMBER() OVER (PARTITION BY province_th ORDER BY COUNT(slope_description) DESC) as rnk
  FROM ThailandTrafficAccident..Thai_traffic_accidents
  GROUP BY slope_description, province_th
)
SELECT province_th, slope_description,  total_accident
FROM RankedAccidents
WHERE rnk = 1;
