#importing required modules
from pandas import *
from math import sqrt
import json

#loading the data
Data = read_csv("passport.csv")
Origin_country = Data['Origin'].tolist()
Destination_country = Data['Destination'].tolist()
Visa_status = Data['Requirement'].tolist()
#preparing the unique values as keys for the analysis

Unique_values = set(Origin_country)
Unique_distination = set(Destination_country)
Unwanted_countries = []

# cleaning incomplete data

for country in Unique_distination:
    if country in Unique_values:
        continue
    else:
        Unwanted_countries.append(country)

# creating s dictionary and another one for storing the index score

Visa_free_dictionary = {}
Country_measure = {}

for value in Unique_values:
    Visa_free_dictionary.update({value : []})

# Filling the dictionry
    
for Country in Unique_values:
    for instance in range(0, len(Origin_country)):
        if (Origin_country[instance] == Country) and (Visa_status[instance] == "Visa Free"):
            Visa_free_dictionary[Country].append(Destination_country[instance])

# calculating the measure and skipping countries that dont exist in the Origin column     
for Country in Unique_values:
    mutual = 0
    unmutual = 0
    for Other_country in Visa_free_dictionary[Country]:
        if Other_country in Unique_values:
            if Country in Visa_free_dictionary[Other_country]:
                mutual += 1
            else:
                unmutual += 1
    Country_measure.update({Country : sqrt((mutual/200 * mutual/(mutual + unmutual)))})

# storing the dictionary in a text file

with open('dictionary_measure.txt', 'w') as file:
     file.write(json.dumps(Country_measure))