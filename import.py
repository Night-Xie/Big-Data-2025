import pandas as pd
import mysql.connector

conn = mysql.connector.connect(host="localhost", user="root", password="yourpass", database="BIG_DATA")
cursor = conn.cursor()

df = pd.read_csv("yourfile.csv")
for _, row in df.iterrows():
    cursor.execute("INSERT INTO your_table (col1, col2) VALUES (%s, %s)", (row["col1"], row["col2"]))

conn.commit()
conn.close()