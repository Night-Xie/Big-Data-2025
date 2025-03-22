# SQL script to join all queries in calculations.sql as one table, uses STATE_MAPPING to
# sync all state name differences between CSVs

USE BIG_DATA; 

DROP TABLE IF EXISTS STATE_MAPPING; 
CREATE TABLE STATE_MAPPING (
    neet VARCHAR(255) PRIMARY KEY,
    india_pop_unemployment VARCHAR(255),
    rbi_schools VARCHAR(255)
);

INSERT INTO STATE_MAPPING (neet, india_pop_unemployment, rbi_schools) VALUES
    ('ANDAMAN AND NICOBAR ISLANDS (UT)', 'Andaman & Nicobar Island', 'Andaman and Nicobar Islands'),
    ('ANDHRA PRADESH', 'Andhra Pradesh', 'Andhra Pradesh'),
    ('ARUNACHAL PRADESH', 'Arunachal Pradesh', 'Arunachal Pradesh'),
    ('ASSAM', 'Assam', 'Assam'),
    ('BIHAR', 'Bihar', 'Bihar'),
    ('CHANDIGARH(UT)', 'Chandigarh', 'Chandigarh'),
    ('CHHATTISGARH', 'Chhattisgarh', 'Chhattisgarh'),
    ('DADRA AND NAGAR HAVELI (UT)', NULL, 'Dadra and Nagar Haveli and Daman and Diu'),
    ('DAMAN AND DIU (UT)', NULL, 'Dadra and Nagar Haveli and Daman and Diu'),
    ('DELHI', 'Delhi', 'Delhi'),
    ('GOA', 'Goa', 'Goa'),
    ('GUJARAT', 'Gujarat', 'Gujarat'),
    ('HARYANA', 'Haryana', 'Haryana'),
    ('HIMACHAL PRADESH', 'Himachal Pradesh', 'Himachal Pradesh'),
    ('JAMMU AND KASHMIR', 'Jammu & Kashmir', 'Jammu and Kashmir'),
    ('JHARKHAND', 'Jharkhand', 'Jharkhand'),
    ('KARNATAKA', 'Karnataka', 'Karnataka'),
    ('KERALA', 'Kerala', 'Kerala'),
    ('LADAKH(UT)', 'Ladakh', 'Ladakh'),
    ('LAKSHADWEEP (UT)', 'Lakshadweep', 'Lakshadweep'),
    ('MADHYA PRADESH', 'Madhya Pradesh', 'Madhya Pradesh'),
    ('MAHARASHTRA', 'Maharashtra', 'Maharashtra'),
    ('MANIPUR', 'Manipur', 'Manipur'),
    ('MEGHALAYA', 'Meghalaya', 'Meghalaya'),
    ('MIZORAM', 'Mizoram', 'Mizoram'),
    ('NAGALAND', 'Nagaland', 'Nagaland'),
    ('ODISHA', 'Odisha', 'Odisha'),
    ('OUTSIDE-INDIA', NULL, NULL),
    ('PUDUCHERRY(UT)', 'Puducherry', 'Puducherry'),
    ('PUNJAB', 'Punjab', 'Punjab'),
    ('RAJASTHAN', 'Rajasthan', 'Rajasthan'),
    ('SIKKIM', 'Sikkim', 'Sikkim'),
    ('TAMIL NADU', 'Tamil Nadu', 'Tamil Nadu'),
    ('TELANGANA', 'Telangana', 'Telangana'),
    ('TRIPURA', 'Tripura', 'Tripura'),
    ('UTTAR PRADESH', 'Uttar Pradesh', 'Uttar Pradesh'),
    ('UTTARAKHAND', 'Uttarakhand', 'Uttarakhand'),
    ('WEST BENGAL', 'West Bengal', 'West Bengal');

DROP TABLE IF EXISTS STATE_RESULTS;
CREATE TABLE STATE_RESULTS AS
WITH NEET AS (
	WITH STATE_AVG AS (
    SELECT state, ROUND(AVG(marks),2) AS STATE_AVERAGE_NEET_MARK
    FROM RESULTS
    GROUP BY state
	), 
	STATE_RATIO AS (
    SELECT state, ROUND(AVG(marks) / (SELECT AVG(marks) FROM RESULTS),2) AS STATE_VS_NATIONAL_RATIO
    FROM RESULTS
    GROUP BY state
	)
	SELECT sa.state, sa.STATE_AVERAGE_NEET_MARK, sr.STATE_VS_NATIONAL_RATIO
	FROM STATE_AVG sa
	JOIN STATE_RATIO sr ON sa.state = sr.state
),
INDIA AS (
	WITH GDP AS (
    	SELECT state, `2011` AS GDP_2011, `2021` AS GDP_2021
    	FROM INDIA
    	WHERE category = "Gross State Domestic Product"
	), 
	GDP_PER_CAPITA AS (
   		SELECT INDIA.state, 
        	   ROUND(INDIA.`2011` / NULLIF(POPULATION_DATA.`2011`, 0), 2) AS GDP_PER_CAPITA_2011,
           	   ROUND(INDIA.`2021` / NULLIF(POPULATION_DATA.`2011`, 0), 2) AS GDP_PER_CAPITA_2021
    	FROM INDIA 
   	    JOIN POPULATION_DATA ON INDIA.state = POPULATION_DATA.state
        WHERE INDIA.category = "Gross State Domestic Product" 
     	   AND POPULATION_DATA.data = "Total Population"
	),
	UNEMPLOYMENT AS (
   		SELECT state, ROUND(AVG(estimated_unemployment_rate),2) AS AVG_ESTIMATED_UNEMPLOYMENT_RATE_2020
    	FROM UNEMPLOYMENT_RATE
    	GROUP BY state
	),
	POPULATION AS (
    	SELECT state, `2011` AS POPULATION_2011, `2021` AS POPULATION_2021
    	FROM POPULATION_DATA
    	WHERE data = "Total Population"
	),
	INCOME AS (
    	SELECT state, `2011` AS PER_CAPITA_INCOME_2011, `2021` AS PER_CAPITA_INCOME_2021
    	FROM INDIA
    	WHERE category = "Per Capita Income"
	),
	LITERACY AS (
    	SELECT state, `2011` AS LITERACY_2011
    	FROM POPULATION_DATA
    	WHERE data = "Literacy Rate"
	)
	SELECT 
    COALESCE(gdp.state, gdp_per_capita.state, unemployment.state, 
             population.state, income.state, literacy.state) AS state,
   			 gdp.GDP_2011, gdp.GDP_2021,
    		 gdp_per_capita.GDP_PER_CAPITA_2011, gdp_per_capita.GDP_PER_CAPITA_2021,
    		 unemployment.AVG_ESTIMATED_UNEMPLOYMENT_RATE_2020,
    		 population.POPULATION_2011, population.POPULATION_2021,
    		 income.PER_CAPITA_INCOME_2011, income.PER_CAPITA_INCOME_2021,
    		 literacy.LITERACY_2011
	FROM GDP gdp
	LEFT JOIN GDP_PER_CAPITA gdp_per_capita ON gdp.state = gdp_per_capita.state
	LEFT JOIN UNEMPLOYMENT unemployment ON gdp.state = unemployment.state
	LEFT JOIN POPULATION population ON gdp.state = population.state
	LEFT JOIN INCOME income ON gdp.state = income.state
	LEFT JOIN LITERACY literacy ON gdp.state = literacy.state
),
SCHOOL AS (
	WITH POVERTY AS (
    	SELECT States_Union_Territories AS state, POVERTY_2011 AS POVERTY_RATE_2011
    	FROM RBI_DATA
	), 
	SCHOOLS_INTERNET AS (
    	SELECT State AS state, Percent_Schools_Internet_All_Management AS SCHOOLS_WITH_INTERNET
    	FROM SCHOOL_INTERNET_FACILITY
	),
	SCHOOLS_COMPUTERS AS (
    	SELECT State AS state, Percent_Schools_Computer_All_Management AS SCHOOLS_WITH_COMPUTERS
    	FROM SCHOOL_COMPUTER_FACILITY
	),
	SCHOOLS_ELECTRICITY AS (
    	SELECT State AS state, Percent_Schools_Functional_Electricity_All_Management AS SCHOOLS_WITH_FUNCTIONAL_ELECTRICITY
    	FROM SCHOOL_ELECTRICITY_FACILITY
	),
	SCHOOLS_LIBRARIES AS (
    	SELECT State AS state, Percent_Schools_with_Library_All_Management AS SCHOOLS_WITH_LIBRARIES
    	FROM LIBRARY_FACILITY
	)
	SELECT 
    	COALESCE(p.state, si.state, sc.state, se.state, sl.state) AS state,
    			 p.POVERTY_RATE_2011,
    			 si.SCHOOLS_WITH_INTERNET,
    			 sc.SCHOOLS_WITH_COMPUTERS,
    			 se.SCHOOLS_WITH_FUNCTIONAL_ELECTRICITY,
    		  	 sl.SCHOOLS_WITH_LIBRARIES
	FROM POVERTY p
	LEFT JOIN SCHOOLS_INTERNET si ON p.state = si.state
	LEFT JOIN SCHOOLS_COMPUTERS sc ON p.state = sc.state
	LEFT JOIN SCHOOLS_ELECTRICITY se ON p.state = se.state
	LEFT JOIN SCHOOLS_LIBRARIES sl ON p.state = sl.state
)
SELECT 
    COALESCE(sm.neet, sm.india_pop_unemployment, sm.rbi_schools) AS STATE,
    		 n.STATE_AVERAGE_NEET_MARK,
    		 n.STATE_VS_NATIONAL_RATIO,
    		 i.GDP_2011, i.GDP_2021,
    		 i.GDP_PER_CAPITA_2011, i.GDP_PER_CAPITA_2021,
    		 i.POPULATION_2011, i.POPULATION_2021,
    		 i.AVG_ESTIMATED_UNEMPLOYMENT_RATE_2020,
    		 i.PER_CAPITA_INCOME_2011, i.PER_CAPITA_INCOME_2021,
    		 i.LITERACY_2011,
    		 s.POVERTY_RATE_2011,
    		 s.SCHOOLS_WITH_INTERNET,
    		 s.SCHOOLS_WITH_COMPUTERS,
    		 s.SCHOOLS_WITH_FUNCTIONAL_ELECTRICITY,
    		 s.SCHOOLS_WITH_LIBRARIES
FROM STATE_MAPPING sm
LEFT JOIN NEET n ON sm.neet = n.state
LEFT JOIN INDIA i ON sm.india_pop_unemployment = i.state
LEFT JOIN SCHOOL s ON sm.rbi_schools = s.state;