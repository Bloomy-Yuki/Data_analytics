#Loading the tidyverse
library(rvest)
library(tidyverse)

#declaring a url variable
url <- 'https://www.imo-official.org/year_statistics.aspx?year=1985'

#using pipes to load the table into the data frame dummy variable df
read_html(url) %>% html_table() %>% data.frame() -> df

#removing extra rows
df <- df[-c(9:20),]

#adding a name to the first column, since it doesn't have one in the webpage
colnames(df)[1] = "Problem Number"

#adding the year to the table
df <- df %>% mutate(Problem_year = 1985)

#our log super table, establishing log as the table where all the other tables will
#get parsed
log = df

#creating a list of years to be scraped 
Dates <- c(1986:2023)

#start of for-loop
for (year in Dates){
  
  #pasting the year as a string to the end of each URL to get the desired webpage
  url <- paste('https://www.imo-official.org/year_statistics.aspx?year=',toString(year),sep ="")
  
  #using the df dummy variable to store the scraped raw data
  url %>% read_html %>% html_table() %>% data.frame() -> df
  
  #removing unwanted rows
  df <- df[-c(9:20),]
  
  #filling the empty column name
  colnames(df)[1] = "Problem Number"
  
  #adding the year as an extra column and to make later cleaning easier
  df <- df %>% mutate(Problem_year = year)
  
  #adding the dummy variable df's table to the log super-table, and preparing to
  #repeat the loop
  log <- bind_rows(log, df)

}