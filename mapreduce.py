import time
import pyspark
from pyspark.sql import SparkSession
from tabulate import tabulate

# create spark session
spark = SparkSession.builder.appName("NeetResults").getOrCreate()

# start timing 
start = time.time() 

# load results csv into RDD 
results = spark.sparkContext.textFile("data/NEET_2024_RESULTS.csv")

# parse required fields (remove illegal values)

def parser(line):
	fields = line.split(",")
	if(fields[1].isdigit()):
		return {"state": fields[2], "marks": int(fields[1])}
	else:
		return None 

parsed = results.map(parser).filter(lambda row: row is not None)

# map results to kv pair (state, (marks, 1))

mapped = parsed.map(lambda row: (row["state"], (row["marks"], 1)))


# reduce to sum(marks), count 

reduced = mapped.reduceByKey(lambda p1,p2 : (p1[0] + p2[0], p1[1] + p2[1]))


# get averages 

total = reduced.map(lambda x: x[1]).reduce(lambda p1,p2: (p1[0] + p2[0], p1[1] + p2[1]))

national_average = total[0] / total[1]

state_average = reduced.mapValues(lambda p: p[0] / p[1])
state_vs_national_ratio = state_average.mapValues(lambda s_avg: s_avg/national_average)

results = state_average.join(state_vs_national_ratio)

# record finish time
end = time.time()

# output results

print(f"National Average : {national_average}")

formatted_results = [(state, avg, ratio) for state, (avg, ratio) in results.collect()]
col_names = ["state", "average_mark", "ratio_vs_national"]
print(tabulate(formatted_results, headers=col_names, tablefmt="fancy_grid"))

time_taken = end - start
print(f"Time elapsed: {time_taken} seconds.")

#stop

spark.stop()

