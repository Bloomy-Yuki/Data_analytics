#loading the tidyverse
library(tidyverse)
library(janitor)

#loading the .csv file into the dataframe
car_df <- read.csv("Files/car_data.csv")

#choosing the colomns that we need in our dashboard
car <- car_df[c('num', 'brand', 'model','color','year','price_in_euro','transmission_type','fuel_type','fuel_consumption_l_100km', 'mileage_in_km')]

#using car2 as dummy variable to store cleaning codes on car variable
car2 <- car

#filtering columns after checking their unique values and noticing that their values has errors

#filtering year in only the range
car2 <- car2 %>% filter( as.integer((year)) %in% c((1995:2023)  ) )

#filtering the fuel type to the main ones
car2 <- car2 %>% filter( fuel_type %in% c("Petrol", "Diesel", "Hybrid", "Electric")  )

#getting only known transmission types
car2 <- car2 %>% filter( transmission_type != "Unknown"  ) 

#filtering the consumption to the results that have dimensional inits
car2 <- car2 %>% filter( grepl("l/100 km", fuel_consumption_l_100km ) == TRUE)

# removing empty values

car2 <- subset(car2, num != "" )
car2 <- subset(car2, brand != "" )
car2 <- subset(car2, model != "" )
car2 <- subset(car2, color != "" )
car2 <- subset(car2, year != "" )
car2 <- subset(car2, price_in_euro != "" )
car2 <- subset(car2, transmission_type != "" )
car2 <- subset(car2, fuel_type != "" )
car2 <- subset(car2, fuel_consumption_l_100km != "" )
car2 <- subset(car2, mileage_in_km != "" )

# creating a new column to store numerical values of fuel comsumption
car2 <- car2 %>%
  mutate(consumption = strsplit(fuel_consumption_l_100km," ")[[1]][1])
