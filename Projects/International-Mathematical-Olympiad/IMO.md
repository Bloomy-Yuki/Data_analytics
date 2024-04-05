# Project : International mathematics olympiad, data and trends

## 1. Task and purpose
---
**Task and Scenario**: The following work focuses on problems presented in international mathematics olympiad from years 1985-2023
and discovering trends and important facts about the gathered dataset to help with the training and preparation of any local math 
team to participate in such competition in a local and global levels.

> Data sources: 
>
> [ IMO official websites ](https://www.imo-official.org/) official results
> 
> [ Art of problem solving archive ](https://artofproblemsolving.com/wiki/index.php/International_Mathematical_Olympiad) category and further info

 By checking the webpages we can see that problems are included within tables with their associated grade distribution, which can be used
indirectly to access difficulty. The metrics of chioce taken here is the fraction of scores getting near perfect score (6-7), and the 
average score, these will be mostly correlated but plotting them as scatterplot will show any mismatch between them indicating unconventional
problem type.
 
## 2. Process description
---
1. A .r script was used originally used to scrape the data, and then the code segments got written into a Jupyter notebook ilustrating the 
   process of obtaining the data and saving in in the "Files\" Directory 
  
2. The data table then got imported into google sheets to perform cleaning and praparation for analysis and viualisation

3. A Tableau Dashbboard was then Made with the intent of conveying findings within the data and the limitation of the data set

4. Not all problem have a category, thus limiting our data sets to the problems that do so


Analysis and visualizations on [Tableau](https://public.tableau.com/views/InternationalMathematicalOlympiadDataCategoryandDifficulty/Dashboard1?:language=en-GB&:sid=&:display_count=n&:origin=viz_share_link)


```python
#Python code
from IPython.display import display, HTML
display(HTML("Files/Dashboard_link.html"))
```



<div class='tableauPlaceholder' id='viz1712125970061' style='position: relative'><noscript><a href='#'><img alt='Dashboard 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;In&#47;InternationalMathematicalOlympiadDataCategoryandDifficulty&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='InternationalMathematicalOlympiadDataCategoryandDifficulty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;In&#47;InternationalMathematicalOlympiadDataCategoryandDifficulty&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-GB' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1712125970061');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} else { vizElement.style.width='100%';vizElement.style.height='1327px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>



## 3. findings and conclusion
---

>using the dashboard we can see that the trend line is positively correlated between the two metrics, using that graph to see high average 
and high fraction of near perfect score we can see that the majority of the problems clustered there are geometry-related, indicating that
problems tend to be on the easier side with respect to other problems.

 >Doing the opposite and looking at problems with low average score and low fraction of near perfect score we find that problems that are
combinatorics-related dominate the cluster, indicating that problems in combinatorics present a challenge to the contestants.

 >Also by examining the problem category share for every 5 year period, we can see a trend of combinatorics problems taking larger share in later 
years, with stark contrast to geometry being the most frequent problem category towards the beginning date of the dataset.


In conclusion, based on the data, a strong recommendation to focus on combinatorics-related problems in training is to be presented. the dashboard
can also provide training problems with their associated difficulty.
