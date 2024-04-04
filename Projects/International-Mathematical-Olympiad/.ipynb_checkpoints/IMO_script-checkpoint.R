library(tidyverse)

url <- 'https://www.imo-official.org/year_statistics.aspx?year=1985'

read_html(url) %>%
  html_table() %>%
  data.frame() -> df

df <- df[-c(9:20),]
colnames(df)[1] = "Problem Number"
df <- df %>% mutate(Problem_year = 1985)

log = df

Dates <- c(1986:2023)


for (y in Dates){
  url <- paste('https://www.imo-official.org/year_statistics.aspx?year=',toString(y),sep ="")
  url %>% read_html %>% html_table() %>% data.frame() -> df
  
  df <- df[-c(9:20),]
  colnames(df)[1] = "Problem Number"
  df <- df %>% mutate(Problem_year = y)
  log <- bind_rows(log, df)

}