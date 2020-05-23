# sample query 1
SELECT *
FROM agri_emissions as a
LEFT JOIN wri_data as w
	ON w.year = a.year
WHERE w.year = a.year;

# sample query 2
SELECT wri_data.country,
wri_data.year,
wri_data.fugitive_emissions,
electric_data.coal,
electric_data.oil
FROM wri_data
INNER JOIN electric_data
ON wri_data.year = electric_data.year;

# sample query 3
SELECT wri_data.country,
wri_data.fugitive_emissions,
electric_data.solar_pv,
electric_data.solar_thermal,
electric_data.wind,
electric_data.year
FROM wri_data
INNER JOIN electric_data
	ON wri_data.year = electric_data.year
WHERE fugitive_emissions > 100;

# sample query 4
SELECT f.state, f.total_reported_emissions, f.facility, e.year, e.waste
FROM emissions_facilities as f, electric_data as e
WHERE f.sector='Waste';

# sample query 5
SELECT a.year, a.crop_cultivation, a.livestock, t.fossil_fuel_combustion_carbon_dioxide,
t.use_of_fluorinated_gases, t.fossil_fuel_combustion_other_greenhouse_gases,
t.other_transportation_categories
FROM agri_emissions as a, trans_emission_types as t
WHERE a.year = t.year;

# sample query 6
SELECT f.state, f.total_reported_emissions, f.facility, e.year, e.waste
FROM emissions_facilities as f, electric_data as e
WHERE f.sector='Waste';

# sample query 7
SELECT v.year, v.passenger_cars, f.annual_fuel_use_gge * v.passenger_cars as total_annual_fuel_useage_gge
FROM fuel_usage as f, vehicle_count as v
WHERE f.vehicle_type='Car';

# sample query 8
SELECT g.year, g.hybrid_electric, v.passenger_cars - g.hybrid_electric as traditional_vehicles
FROM green_vehicles as g, vehicle_count as v
WHERE g.year=v.year;

