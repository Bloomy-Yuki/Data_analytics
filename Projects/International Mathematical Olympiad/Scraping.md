## An R Markdown file to scrape the data from [IMO official website](https://www.imo-official.org/)
### General Idea

fist we need to get the link to the problems and use some variable date to scrape
the tables and change it to a data frame, then clean each table individually and lastly
parsing them all together and saving the result as a .csv file for later cleaning
and analysis.


```R
#Loading the tidyverse
library(rvest)
library(tidyverse)
```

    ── [1mAttaching core tidyverse packages[22m ──────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
    [32m✔[39m [34mdplyr    [39m 1.1.4     [32m✔[39m [34mreadr    [39m 2.1.5
    [32m✔[39m [34mforcats  [39m 1.0.0     [32m✔[39m [34mstringr  [39m 1.5.1
    [32m✔[39m [34mggplot2  [39m 3.5.0     [32m✔[39m [34mtibble   [39m 3.2.1
    [32m✔[39m [34mlubridate[39m 1.9.3     [32m✔[39m [34mtidyr    [39m 1.3.1
    [32m✔[39m [34mpurrr    [39m 1.0.2     
    ── [1mConflicts[22m ────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m         masks [34mstats[39m::filter()
    [31m✖[39m [34mreadr[39m::[32mguess_encoding()[39m masks [34mrvest[39m::guess_encoding()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m            masks [34mstats[39m::lag()
    [36mℹ[39m Use the conflicted package ([3m[34m<http://conflicted.r-lib.org/>[39m[23m) to force all conflicts to become errors
    

### Scraping the first table

We need to establish a fist table, as a basis for all our clean ones to get parsed into.
and as such we start by using the link and some functions to do so


```R
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
log
```


<table class="dataframe">
<caption>A data.frame: 8 × 8</caption>
<thead>
	<tr><th></th><th scope=col>Problem Number</th><th scope=col>P1</th><th scope=col>P2</th><th scope=col>P3</th><th scope=col>P4</th><th scope=col>P5</th><th scope=col>P6</th><th scope=col>Problem_year</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>Num( P# = 0 )</td><td> 32</td><td>60</td><td>153</td><td>61</td><td>113</td><td>57</td><td>1985</td></tr>
	<tr><th scope=row>2</th><td>Num( P# = 1 )</td><td> 46</td><td>27</td><td> 27</td><td>28</td><td> 21</td><td>74</td><td>1985</td></tr>
	<tr><th scope=row>3</th><td>Num( P# = 2 )</td><td> 11</td><td> 8</td><td>  8</td><td>46</td><td> 20</td><td>19</td><td>1985</td></tr>
	<tr><th scope=row>4</th><td>Num( P# = 3 )</td><td>  9</td><td> 9</td><td>  5</td><td>18</td><td>  7</td><td>13</td><td>1985</td></tr>
	<tr><th scope=row>5</th><td>Num( P# = 4 )</td><td>  4</td><td> 3</td><td>  1</td><td>16</td><td>  7</td><td> 9</td><td>1985</td></tr>
	<tr><th scope=row>6</th><td>Num( P# = 5 )</td><td>  2</td><td> 4</td><td>  0</td><td> 6</td><td>  5</td><td>10</td><td>1985</td></tr>
	<tr><th scope=row>7</th><td>Num( P# = 6 )</td><td>  2</td><td> 6</td><td>  3</td><td> 2</td><td>  1</td><td> 4</td><td>1985</td></tr>
	<tr><th scope=row>8</th><td>Num( P# = 7 )</td><td>103</td><td>92</td><td> 12</td><td>32</td><td> 35</td><td>23</td><td>1985</td></tr>
</tbody>
</table>



### Looping through the years

Now all that we have to do is to use a for-loop to repeat the process and append
every table of every year to the log super-table, this can be achieved as follows:


```R
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
```

## Saving the results as .csv

Analysis and visualizations on [Tableau](https://public.tableau.com/views/InternationalMathematicalOlympiadDataCategoryandDifficulty/Dashboard1?:language=en-GB&:sid=&:display_count=n&:origin=viz_share_link)


```R
write.csv(log, "Name_of_your_file.csv")
```
