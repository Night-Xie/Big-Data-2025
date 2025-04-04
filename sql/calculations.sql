# -- -- National results -- --

# Get average NEET mark (country-wide) // 0.98 sec
SELECT AVG(marks) AS NATIONAL_AVERAGE_NEET_MARK
FROM RESULTS;

# -- -- State results -- -- --

	# -- -- -- Neet Marks -- -- -- 

#(state, STATE_AVERAGE_NEET_MARK) // 2.44 sec
SELECT state, ROUND(AVG(marks),2) AS STATE_AVERAGE_NEET_MARK
FROM RESULTS
GROUP BY state;

#(state, STATE_VS_NATIONAL_RATIO) // 2.79 sec 
SELECT state, ROUND(AVG(marks) / (SELECT AVG(marks) FROM RESULTS),2) AS STATE_VS_NATIONAL_RATIO
FROM RESULTS
GROUP BY state;

	# -- -- -- Economic Status -- -- -- 

#(state, GDP_2011, GDP_2021) // 0.01 sec
SELECT state, `2011` AS GDP_2011, `2021` AS GDP_2021
FROM INDIA
WHERE category = "Gross State Domestic Product";

#(state, GDP_PER_CAPITA_2011, GDP_PER_CAPITA_2021) // 0.00 sec
SELECT INDIA.state, 
	   ROUND(INDIA.`2011` /  POPULATION_DATA.`2011`,2) AS GDP_PER_CAPITA_2011,
	   ROUND(INDIA.`2021` / POPULATION_DATA.`2011`,2) AS GDP_PER_CAPITA_2021
FROM INDIA JOIN POPULATION_DATA
ON INDIA.state = POPULATION_DATA.state
WHERE INDIA.category = "Gross State Domestic Product" AND POPULATION_DATA.data = "Total Population";

#(state, AVG_ESTIMATED_UNEMPLOYMENT_RATE_2020) // 0.01 sec
SELECT state, ROUND(AVG(estimated_unemployment_rate),2) AS AVG_ESTIMATED_UNEMPLOYMENT_RATE_2020
FROM UNEMPLOYMENT_RATE
GROUP BY state;

#(state, POPULATION_2011, POPULATION_2021) // 0.00 sec
SELECT state, `2011` AS POPULATION_2011, `2021` AS POPULATION_2021
FROM POPULATION_DATA
WHERE data = "Total Population";

#(state, PER_CAPITA_INCOME_2011, PER_CAPITA_INCOME_2021) // 0.01 sec
SELECT state, `2011` AS PER_CAPITA_INCOME_2011, `2021`AS PER_CAPITA_INCOME_2021
FROM INDIA
WHERE category = "Per Capita Income";

#(state, LITERACY_2011) // 0.00 sec
SELECT state, `2011` AS LITERACY_2011
FROM POPULATION_DATA
WHERE data = "Literacy Rate";

#(state, POVERTY_RATE_2011) // 0.00 sec
SELECT States_Union_Territories AS state, POVERTY_2011 AS POVERTY_RATE_2011
FROM RBI_DATA;

	# -- -- -- Education Infrastructure -- -- -- 

#(state, SCHOOLS_WITH_INTERNET) // 0.00 sec
SELECT State AS state, Percent_Schools_Internet_All_Management AS SCHOOLS_WITH_INTERNET
FROM SCHOOL_INTERNET_FACILITY;

#(state, SCHOOLS_WITH_COMPUTERS) // 0.01 sec
SELECT State AS state, Percent_Schools_Computer_All_Management AS SCHOOLS_WITH_COMPUTERS
FROM SCHOOL_COMPUTER_FACILITY;

#(state, SCHOOLS_WITH_FUNCTIONAL_ELECTRICITY) // 0.00 sec
SELECT State AS state, Percent_Schools_Functional_Electricity_All_Management AS SCHOOLS_WITH_FUNCTIONAL_ELECTRICITY
FROM SCHOOL_ELECTRICITY_FACILITY;

#(state, SCHOOLS_WITH_LIBRARIES) // 0.00 sec
SELECT State AS state, Percent_Schools_with_Library_All_Management AS SCHOOLS_WITH_LIBRARIES
FROM LIBRARY_FACILITY;



