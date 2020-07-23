import pandas as pd

#Use API to request data
data = pd.read_csv('https://data.virginia.gov/resource/bre9-aqqr.csv')
data.to_csv("cases.csv")