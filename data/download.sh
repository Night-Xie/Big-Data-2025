#!/bin/bash

#NEET 
curl -L -o neet-2024-ug-results-citycenter-wise.zip\
  https://www.kaggle.com/api/v1/datasets/download/aakaash89/neet-2024-ug-results-citycenter-wise
unzip neet-2024-ug-results-citycenter-wise.zip
rm neet-2024-ug-results-citycenter-wise.zip

#Unemployment
curl -L -o unemployment-in-india.zip\
  https://www.kaggle.com/api/v1/datasets/download/gokulrajkmv/unemployment-in-india
unzip unemployment-in-india.zip
rm unemployment-in-india.zip

#Phone usage 
curl -L -o phone-usage-in-india.zip\
  https://www.kaggle.com/api/v1/datasets/download/akashsharma0105/phone-usage-in-india
unzip phone-usage-in-india.zip
rm phone-usage-in-india.zip

#Indian-state GDP and population
curl -L -o indian-state-gdp-and-population.zip\
  https://www.kaggle.com/api/v1/datasets/download/shubhamsinha1107/indian-state-gdp-and-population
unzip indian-state-gdp-and-population.zip
rm indian-state-gdp-and-population.zip

#India's state-wise data
curl -L -o indian-statewise-data-from-rbi.zip\
  https://www.kaggle.com/api/v1/datasets/download/gokulrajkmv/indian-statewise-data-from-rbi
unzip indian-statewise-data-from-rbi.zip
rm indian-statewise-data-from-rbi.zip

#Indian States Education Statistics
curl -L -o indian-states-education-statistics.zip\
  https://www.kaggle.com/api/v1/datasets/download/jiteshkumarsahoo/indian-states-education-statistics
unzip indian-states-education-statistics.zip
rm indian-states-education-statistics.zip

