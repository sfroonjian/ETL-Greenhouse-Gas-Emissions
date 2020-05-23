-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "wri_data" (
    "country" VARCHAR   NOT NULL,
    "year" INT   NOT NULL,
    "electricity_heat" INT   NOT NULL,
    "manufactur_construction" INT   NOT NULL,
    "transportation" INT   NOT NULL,
    "other_fuel_combust" INT   NOT NULL,
    "fugitive_emissions" INT   NOT NULL,
    CONSTRAINT "pk_wri_data" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "country_food_emissions" (
    "country_id" int   NOT NULL,
    "country" VARCHAR(80)   NOT NULL,
    "pig" decimal   NOT NULL,
    "poultry" decimal   NOT NULL,
    "beef" decimal   NOT NULL,
    "lamb_and_mutton" decimal   NOT NULL,
    "farmed_fish" decimal   NOT NULL,
    "eggs" decimal   NOT NULL,
    "dairy" decimal   NOT NULL,
    "total_kg_co2_person_yr_aniaml_products" decimal   NOT NULL,
    "wheat_products" decimal   NOT NULL,
    "rice" decimal   NOT NULL,
    "soybeans" decimal   NOT NULL,
    "nuts" decimal   NOT NULL,
    "total_kg_co2_person_yr_nonaniaml_products" decimal   NOT NULL,
    CONSTRAINT "pk_country_food_emissions" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "agri_emissions" (
    "year" int   NOT NULL,
    "crop_cultivation" decimal   NOT NULL,
    "livestock" decimal   NOT NULL,
    "fuel_combustion" decimal   NOT NULL,
    "total" decimal   NOT NULL,
    CONSTRAINT "pk_agri_emissions" PRIMARY KEY (
        "year"
     )
);

CREATE TABLE "electric_waste" (
    "year" INT   NOT NULL,
    "industrial_waste" INT   NOT NULL,
    "primary_solid_biofuels" INT   NOT NULL,
    "biogases" INT   NOT NULL,
    "municipal_waste" INT   NOT NULL,
    "liquid_biofuels" INT   NOT NULL,
    "units" VARCHAR   NOT NULL
);

CREATE TABLE "electric_data" (
    "year" INT   NOT NULL,
    "coal" INT   NOT NULL,
    "oil" INT   NOT NULL,
    "natural_gas" INT   NOT NULL,
    "biofuels" INT   NOT NULL,
    "waste" INT   NOT NULL,
    "nuclear" INT   NOT NULL,
    "water" INT   NOT NULL,
    "geothermal" INT   NOT NULL,
    "solar_pv" INT   NOT NULL,
    "solar_thermal" INT   NOT NULL,
    "wind" INT   NOT NULL,
    "tide" INT   NOT NULL,
    "other_sources" INT   NOT NULL,
    "units" VARCHAR   NOT NULL
);

CREATE TABLE "green_vehicles" (
    "index" INT   NOT NULL,
    "year" INT   NOT NULL,
    "hybrid_electric" INT   NOT NULL,
    "plug-in_hybrid-electric" INT   NOT NULL,
    "electric" INT   NOT NULL,
    CONSTRAINT "pk_green_vehicles" PRIMARY KEY (
        "index"
     )
);

CREATE TABLE "fuel_usage" (
    "index" INT   NOT NULL,
    "vehicle_type" VARCHAR   NOT NULL,
    "mpg_gasoline" FLOAT   NOT NULL,
    "mpg_diesel" FLOAT   NOT NULL,
    "vmt" FLOAT   NOT NULL,
    "annual_fuel_use_gge" FLOAT   NOT NULL,
    CONSTRAINT "pk_fuel_usage" PRIMARY KEY (
        "index"
     )
);

CREATE TABLE "trans_emission_types" (
    "index" INT   NOT NULL,
    "year" INT   NOT NULL,
    "fossil_fuel_combustion_carbon_dioxide" FLOAT   NOT NULL,
    "use_of_fluorinated_gases" FLOAT   NOT NULL,
    "fossil_fuel_combustion_other_greenhouse_gases" FLOAT   NOT NULL,
    "other_transportation_categories" FLOAT   NOT NULL,
    CONSTRAINT "pk_trans_emission_types" PRIMARY KEY (
        "index"
     )
);

CREATE TABLE "vehicle_count" (
    "index" INT   NOT NULL,
    "year" INT   NOT NULL,
    "air_carrier" INT   NOT NULL,
    "general_aviation_active_fleet" INT   NOT NULL,
    "highway_total_registered_vehicles" INT   NOT NULL,
    "passenger_cars" INT   NOT NULL,
    "motorcycle" INT   NOT NULL,
    "other_2-axle_4-tire_vehicles" INT   NOT NULL,
    "truck_single-unit_2-axle_6-tire_or_more" INT   NOT NULL,
    "truck_combinationd" INT   NOT NULL,
    "bus" INT   NOT NULL,
    "motor_bus" INT   NOT NULL,
    "light_rail_cars" INT   NOT NULL,
    "heavy_rail_cars" INT   NOT NULL,
    "trolley_bus" INT   NOT NULL,
    "commuter_rail_cars_and_locomotives" INT   NOT NULL,
    "demand_responsive" INT   NOT NULL,
    "other" INT   NOT NULL,
    "class_I_freight_cars" INT   NOT NULL,
    "class_I_locomotive" INT   NOT NULL,
    "nonclass_I_freight_cars" INT   NOT NULL,
    "car_companies_and_shippers_freight_cars" INT   NOT NULL,
    "amtrak_passenger_train_car" INT   NOT NULL,
    "amtrak_locomotive" INT   NOT NULL,
    "nonself-propelled_vessels" INT   NOT NULL,
    "self-propelled_vessels" INT   NOT NULL,
    "oceangoing_self-propelled_vessels_1000_gross_tons_and_over" INT   NOT NULL,
    "recreational_boats" INT   NOT NULL,
    CONSTRAINT "pk_vehicle_count" PRIMARY KEY (
        "index"
     )
);

CREATE TABLE "emissions_facilities" (
    "id" INT   NOT NULL,
    "facility" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "total_reported_emissions" VARCHAR   NOT NULL,
    "sector" VARCHAR   NOT NULL,
    CONSTRAINT "pk_emissions_facilities" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "electric_waste" ADD CONSTRAINT "fk_electric_waste_year" FOREIGN KEY("year")
REFERENCES "agri_emissions" ("year");

ALTER TABLE "electric_data" ADD CONSTRAINT "fk_electric_data_year" FOREIGN KEY("year")
REFERENCES "agri_emissions" ("year");

ALTER TABLE "green_vehicles" ADD CONSTRAINT "fk_green_vehicles_year" FOREIGN KEY("year")
REFERENCES "agri_emissions" ("year");

ALTER TABLE "trans_emission_types" ADD CONSTRAINT "fk_trans_emission_types_year" FOREIGN KEY("year")
REFERENCES "agri_emissions" ("year");

ALTER TABLE "vehicle_count" ADD CONSTRAINT "fk_vehicle_count_year" FOREIGN KEY("year")
REFERENCES "agri_emissions" ("year");

