# Project : William Lowell Putnam Mathematical Competition

## 1. Task and purpose
---
**Task and Scenario**: The project aims to create an overview of the problems presented at the putnam mathematics
competition in order to invistigate the difficulty of problems and how challenging it is to solve these problems. this is done
through plotting the ratio of people who attempt to solve the problem against the ratio of those who got near full score to those who
attempted to solve it, hoping to get an insight to how "surprising" it is to solve these problems. Ultimatly hoping to know which problems 
would the best to practice on in order to improve the results of a team using the outliers.

> Data sources: 
>
> [ The Putnam Archive ](https://kskedlaya.org/putnam-archive/) official results and distribution


 Checking the webpages we can see that the scraping of the data is straightforward, writing the second table to a dataframe and transposing
 it in order to parse all the data in .csv file.
 
## 2. Process description
---
1. A .r script was used originally used to scrape the data, and then the code segments got written into a Jupyter notebook ilustrating the 
   process of obtaining the data and saving in in the "Files\" Directory. 
  
2. The data table then got imported into google sheets to perform cleaning and praparation for analysis and viualisation.

3. A Tableau Dashbboard was then Made with the intent of conveying the findings.


Analysis and visualizations on [Tableau](https://public.tableau.com/views/WilliamLowellPutnamMathematicalCompetition-DataandDifficulty/Dashboard1?:language=en-GB&:sid=&:display_count=n&:origin=viz_share_link)

### 3. Conclusion
---
> The dashboard seems to an apparent correlation between ratio of participation and ratio of near full score
> with some outlier that might seems to indicate a surprising difficulty when attempting to solve the problem

> In a future training scenario, using problems towards the lower values indicate more difficulty and surprising 
> solution tactics, and would be recommended to train a team in order to prepare to participate in the Putnam mathematics
> competetion


```python
#Python code
from IPython.display import display, HTML
display(HTML("Files/Dashboard_link.html"))
```


<html>
    <div class='tableauPlaceholder' id='viz1714903451231' style='position: relative'><noscript><a href='#'><img alt='William Lowell Putnam Mathematical Competition - Data and Difficulty. ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Wi&#47;WilliamLowellPutnamMathematicalCompetition-DataandDifficulty&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='WilliamLowellPutnamMathematicalCompetition-DataandDifficulty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Wi&#47;WilliamLowellPutnamMathematicalCompetition-DataandDifficulty&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-GB' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1714903451231');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1024px';vizElement.style.height='795px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1024px';vizElement.style.height='795px';} else { vizElement.style.width='100%';vizElement.style.height='1027px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
</html>

