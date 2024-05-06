#Loading the tidyverse
library(rvest)
library(tidyverse)

#declaring a url variable
url <- 'https://kskedlaya.org/putnam-archive/putnam1995stats.html'

#using pipes to load the table into the data frame dummy variable df
url %>% read_html %>% html_table() %>% .[[2]] -> df 

#transforming the data into a datafram and transposing it
df <- data.frame(df)
df <- t(df)
df <- data.frame(df)

#adding names to the first column and then assaignin them to be the column names 
df[1,13] <- "Blank"
df[1,1] <- "Problem"
df[2,1] <- "A1"
df[3,1] <- "A2"
df[4,1] <- "A3"
df[5,1] <- "A4"
df[6,1] <- "A5"
df[7,1] <- "A6"
df[8,1] <- "B1"
df[9,1] <- "B2"
df[10,1] <- "B3"
df[11,1] <- "B4"
df[12,1] <- "B5"
df[13,1] <- "B6"
colnames(df) <- c(df[1,])

#deleting the first and last column since they include redundant info and storing the result as
#default dataframe to be appended to 
df <- df[-c(1,14),]
df <- df %>% mutate(Year = 1995)
log <-  df

#creating a list of years to be scraped 
Dates <- c(1996:2019,2021:2023)

#start of for-loop to create the data
for (year in Dates){
  
  #pasting the year as a string to the end of each URL to get the desired webpage
    url <- paste('https://kskedlaya.org/putnam-archive/putnam',paste(toString(year), 'stats.html', sep = ""),sep ="")
  
  #using the df dummy variable to store the scraped raw data
    url %>% read_html %>% html_table() %>% .[[2]] -> df  
  
  #transforming and transposing the data to prepare for modification
    df <- data.frame(df)
    df <- t(df)
    df <- data.frame(df)
  
  #standardizing the problem name to A/B 1-6 and then assigning the column names
    df[1,13] <- "Blank"
    df[1,1] <- "Problem"
    df[2,1] <- "A1"
    df[3,1] <- "A2"
    df[4,1] <- "A3"
    df[5,1] <- "A4"
    df[6,1] <- "A5"
    df[7,1] <- "A6"
    df[8,1] <- "B1"
    df[9,1] <- "B2"
    df[10,1] <- "B3"
    df[11,1] <- "B4"
    df[12,1] <- "B5"
    df[13,1] <- "B6"
    colnames(df) <- c(df[1,])
    
  #deleting the first and last rows due to redundancy
    df <- df[-c(1,14),]
    df <- df %>% mutate(Year = year)
  
  #appeding the dummy df dataframe to the log dataframe and getting to end of loop
    log <- bind_rows(log, df)

}

#renaming row names to the number of the porblem in serial manner
rownames(log) <- c(1:336)
