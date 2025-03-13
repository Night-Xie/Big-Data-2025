import pandas as pd
import mysql.connector
import sys
import getpass
import numpy as np

#check arg len 
if len(sys.argv) != 2: 
    print("Usage: python import.py <mysql_user>")
    sys.exit(1)

#get command line args
mysql_user = sys.argv[1]
mysql_password = getpass.getpass(f"Enter password for user {mysql_user} (leave empty for no password):") or None

#connect to sql
link_args = {
    "host": "localhost",
    "user": mysql_user,
    "database": "BIG_DATA"
}
if mysql_password:
    link_args["password"] = mysql_password

# map csv : table_name

source_sql_map = {
    "data/RBI DATA states_wise_population_Income.csv": "RBI_DATA",
    "data/internet-facility.csv": "SCHOOL_INTERNET_FACILITY",
    "data/computer-availability.csv": "SCHOOL_COMPUTER_FACILITY",
    "data/electricity-availability.csv": "SCHOOL_ELECTRICITY_FACILITY",
    "data/vocational-courses-taken.csv": "VOCATIONAL_COURSES",
    "data/india.csv": "INDIA",
    "data/library-facility.csv": "LIBRARY_FACILITY",
    "data/number-of-teachers.csv": "NUMBER_OF_TEACHERS",
    "data/population.csv": "POPULATION_DATA",
    "data/NEET_2024_RESULTS.csv": "RESULTS",
    "data/Unemployment in India.csv": "UNEMPLOYMENT_RATE",     
}

def get_columns(cursor, table_name):
    cursor.execute(f"SHOW COLUMNS FROM {table_name}")
    return [row[0] for row in cursor.fetchall()]

# function to load data from csv to sql table
def load(cursor, source_sql_map):
    for csv_file, table_name in source_sql_map.items():
        try:
            df = pd.read_csv(csv_file)
            df = df.replace({np.nan: None})

            columns = get_columns(cursor, table_name)

            placeholders = ', '.join(['%s'] * len(df.columns))
            columns_str = ', '.join([f"`{col}`" for col in columns])

            sql = f"INSERT INTO {table_name} ({columns_str}) VALUES ({placeholders})"

            rows = 0
            for _, row in df.iterrows():
                rows = rows+1
                cursor.execute(sql, tuple(row))

            print(f"Imported {rows} rows from {csv_file} into {table_name}.")

        except Exception as err:
            print(f"Error processing {csv_file}: {err}")

# establish connection and load data
link = mysql.connector.connect(**link_args)
cursor = link.cursor()

load(cursor, source_sql_map)

# commit & close connection
link.commit()
cursor.close()
link.close()
