# Big-Data-2025

Git Repo for Big Data Project (2025) 

## How to run the code : 

From project root -

### Download files : 

 - bash data/download.sh 					<- download all csv files

### Getting results from MYSQL :

1. mysql run "SOURCE sql/setup.sql"			<- setup tables in mysql
2. python import.py sql_user				<- import data from CSVs

3. mysql run queries from sql/calculations.sql <- get specific results (contains benchmark time for all queries)
3. mysql run "SOURCE sql/get_results.sql" 	   <- get ALL results as SQL table state_results (for further analysis)

### Getting results with Spark (NEET mark averages)

1. python mapreduce.py						<- get computation-intensive results as formatted table 

## Datasets

Main Dataset (NEET) : https://www.kaggle.com/datasets/aakaash89/neet-2024-ug-results-citycenter-wise (197.29 MB)
Columns : (dummy_srino, marks, state, city, centre_name, centre_number)

Dataset 1 (Unemployed) : https://www.kaggle.com/datasets/gokulrajkmv/unemployment-in-india?select=Unemployment_Rate_upto_11_2020.csv (65.32 kB)
Columns : (Region, Date, Frequency, Estimated Unemployment Rate (%), Estimated Employed, Estimated Labour Participate Rate (%), Region, longitude, latitude)

Dataset 2 (GDP & Population) : https://www.kaggle.com/datasets/shubhamsinha1107/indian-state-gdp-and-population?select=population.csv (7.96 MB)
Columns : (state, years ... ) 

Dataset 3 (Statewise data, income) : https://www.kaggle.com/datasets/gokulrajkmv/indian-statewise-data-from-rbi (2.46 kB)
Columns : (States_Union Territories,2000-01-INC,2011-12-INC,2001 - LIT,2011- LIT,2001 - POP,2011- POP,2001 -SEX_Ratio,2011 -SEX_Ratio,2001 -UNEMP,2011 -UNEMP,2001 -Poverty,2011 -Poverty)

Dataset 4 (Education) : https://www.kaggle.com/datasets/jiteshkumarsahoo/indian-states-education-statistics?select=vocational-courses-taken.csv (78.1 kB)
CSVs : availability-of-boys-toilet.csv
availability-of-girls-toilet.csv
computer-availability.csv
drinking-water-availability.csv
electricity-availability.csv
handwash-availability.csv
internet-facility.csv
library-facility.csv
medical-checkup.csv
merged_data.csv
number-of-teachers.csv
ramp-for-special-needs-students.csv
scheduled-caste-population.csv
scheduled-tribes-population.csv
student-enrollment.csv
vocational-courses-taken.csv
