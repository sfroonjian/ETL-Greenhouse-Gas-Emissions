## **Data Cleaning Explanation:**
The tables gathered for this project focus on how different sub sectors play a part in gas emissions. 

Three tables (electric_data, electric_waste, and wri_data)  were collected to reflect this information on a worldwide scale. Two tables,electric_data and electric_waste, from the International Energy Agency(IEA) contains gas emissions data collected from 1990 to 2015. The third table, wri_data, from the World Resources Institute which contains gas emissions data collected from 1980 to 2012. 

The two tables from the IEA didn’t need too much cleaning. The column names were changed to be sql friendly. One limiting factor for the two IEA tables is that it isn’t separated by country and the information is gathered every 5 years compared to the World Resource Institute which gathers gas emissions data every year. The electric_waste table also only has data for this specific indicator from 1990-2005. There didn’t seem to be any information explaining the reason why on their website. 

The table from the Word Resources Institute, wri_data, was also pretty organized. The column names were changed for SQL use, there was also a significant amount of NaNs that needed to be removed from the 1970s. Because of this, the reports from the 186 countries may have some years missing.

The agri_emissions table came as a csv file from the EPA’s website. Once uploaded into the Jupyter Notebook, the columns and rows had to be switched so that all the years were in a single column instead of the column headers. The top row of the data frame then had to be pushed up to be the column headers. The index then had to be reset so that the years were the first column instead of the index. Lastly, the column headers had to be renamed to fit PostgreSQL’s naming format.

The country_food_emissions table had to be scraped from a web page using Splinter and Beautiful Soup. Because the table on the webpage had icons instead of words as column headers, the data frame had unnamed headers, and every column had to be renamed. Then only the data for food that was “actually consumed” and the totals were kept by deleting the data related to “supplied for consumption”. An issue this data frame initially had was that there were 3 levels of column headers, but to import into PostgreSQL, there can only be one. Therefore, two levels had to be removed and the remaining level had to be renamed more appropriately.

The fuel_usage table was built from a csv base file and required minimal cleaning. A source column was dropped as it was unnecessary for this current project, otherwise the only changes made were to column names to match Postgres styling and column dtypes were changed to ensure all numeric values were integers or floats. 

The trans_emission_types was built from a csv base file and was first filtered to a select range of years. Columns were renamed to match Postgres styling, the table was transposed to allow years to act as a column and not rows, and the year column was reformatted into an integer data type.

The green_vehicles table was built from a csv base file. All year tags had to be renamed to remove extra text and missing data had to be replaced with zero values rather than the letter Z. The table was transposed to make “year” a column and all column names were restyled for Postgres. The entire table was also recast as int64 to allow for use in queries.

The vehicle_count table was built from a csv base file and required more involved cleaning. The data was filtered to a select range of years and unnecessary columns were dropped along with all rows containing NaN values, as they were populated from internal header rows in the original file. All rows with missing data were also dropped and the table was transposed to make “year” into a column and not row. Column names had to be changed to match Postgres styling and the entire table was recast as int64.

The emissions_facilities table was built by scraping the EPA “FLIGHT” website. 

## **Table descriptions:**
electric_data
This table has data with the indicator as “Electricity Generation by Source” such as 

electric_waste
This table has data with the indicator as “Electricity Generation From Biofuels and Waste by Source” such as biogas and biofuels.

wri_data
This table includes yearly data from 1980-2012 from 186 countries. It measures CO2 levels in metric tons. 

agri_emissions
This table has the emissions (in metric tons of carbon dioxide equivalents) produced in crop cultivation, livestock, fuel combustion, and the total of all 3 agricultural sectors in the U.S. from 1990-2018.

country_food_emissions
The table has the kg CO2/person/year produced by actually consuming several animal and non-animal products, along with the totals, for 130 countries from 2018.

green_vehicles
This table has the total count for hybrid-electric, plug-in hybrid electric, and electric vehicles registered in the United States annually between 2000-2018.

fuel_usage
This table has annual fuel use data for various vehicle types and is intended as a reference for calculating annual total fuel use in concert with other tables. 

trans_emission_types
This table has the annual emission data of the transportation sector of the United States broken down by types of emission, covering 2000-2006.

vehicle_count
This table has a count of the number of active/registered vehicles of various classes in the United States annually between 2000-2006.

emissions_facilities
The table will hold data regarding reported emissions by industry in the United States for the year 2018. Each row holds facility name, state (location in USA), total reported emissions, and product of each facility.

For example queries please see query.sql file

## **Links to tables used:**
electric_data
https://www.iea.org/data-and-statistics?country=WORLD&fuel=Energy%20supply&indicator=Electricity%20generation%20by%20source

electric_waste
https://www.iea.org/data-and-statistics?country=WORLD&fuel=Energy%20supply&indicator=Electricity%20generation%20from%20biofuels%20and%20waste%20by%20source

wri_data - Country Greenhouse Gas Emissions Data
https://datasets.wri.org/dataset/cait-country

agri_emissions
https://cfpub.epa.gov/ghgdata/inventoryexplorer/#agriculture/allgas/source/all

country_food_emissions
https://www.nu3.de/blogs/nutrition/food-carbon-footprint-index-2018

green_vehicles
https://www.bts.gov/content/gasoline-hybrid-and-electric-vehicle-sales

fuel_usage
https://afdc.energy.gov/data/10308

trans_emission_types
https://cfpub.epa.gov/ghgdata/inventoryexplorer/#allsectors/allgas/econsect/all

vehicle_count
https://www.bts.gov/content/number-us-aircraft-vehicles-vessels-and-other-conveyances

EPA “Flight” Application (Industry Emissions)
http://ghgdata.epa.gov/ghgp/main.do#
