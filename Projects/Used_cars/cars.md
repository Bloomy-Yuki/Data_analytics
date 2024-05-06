# Project : Used cars in Germany

## 1. Task and purpose
---
**Task and Scenario**: Germany has one of the biggest car markets around, due to this fact, getting insight into the market with
numbers and figures can be largely profitable and would give an edge to the person trying to get into the market. This project aims to 
provide an overview of data scraped from [Autoscout24](https://www.autoscout24.de/) (one of the largest online used cars markets in germany). and hopefully through the cleaning of the data and putting it into a dashboard, the hypothtical car dealer can benefit mainly from the distribution of 
prices and mileage.

> Data sources: 
>
> [Kaggle Dataset](https://www.kaggle.com/datasets/wspirat/germany-used-cars-dataset-2023) where the scraped data was obtained
>
> [ Autoscout24.de ](https://www.autoscout24.de/) is the main source of data 



## 2. Process description
---
1. the dataset was downloaded from Kaggle and loaded into Rstudio
  
2. the dataset seems to need some cleaning, which was done alongside choosing the relavant columns for the dashboard

3. the clean dataset was loaded into tableau and put in use in the dashboard


Analysis and visualizations on [Tableau](https://public.tableau.com/views/UsedcarsinGermanythedatavisualized/Dashboard2?:language=en-GB&:sid=&:display_count=n&:origin=viz_share_link)

### 3. Conclusion
---
> The end result is a dashboard that may be helpful to consider the profitability of a potentiall offer

> the dashboard includes many useful information, which can be used in further neural network models


```python
#Python code
from IPython.display import display, HTML
display(HTML("Files/Dashboard_link.html"))
```


<html>
    <div class='tableauPlaceholder' id='viz1714941191016' style='position: relative'><noscript><a href='#'><img alt='Dashboard 2 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Us&#47;UsedcarsinGermanythedatavisualized&#47;Dashboard2&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='UsedcarsinGermanythedatavisualized&#47;Dashboard2' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Us&#47;UsedcarsinGermanythedatavisualized&#47;Dashboard2&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-GB' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1714941191016');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='1400px';vizElement.style.height='1227px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
</html>

