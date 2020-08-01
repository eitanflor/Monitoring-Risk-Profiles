<p align="center">
    <img src="https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/panthers-protecting-panthers.png">
<p>

<p align="center">
  <h1 align="center" fontsize="2em">p y P 3</h1>
  <h2 align="center" fontsize="2em">Python Extension (Add-On) to Panthers Protecting Panthers</h2>
</p>

<p align="center">Risk Profiling with Python, Tableau, Neo4j, SQL, and Statistics</p>

# Monitoring Risk Profiles (COVID-19)

## Project Overview and Problem Statement
How can FIU effectively track and monitor risk profiles for students, faculty, and administrative and support staff? What would be effective mechanism(s) to assign risk scores and maintain risk profiles based on personal factors (such as individual health, household composition) versus community factors (such as number of people tested positive who are on campus, numbers out there for community, region, etc)?

Click [here](https://business.fiu.edu/academic-departments/is/covid19-datathon/challenge-prompts.cfm) to access the full specifications on FIU’S ATOM COVID-19 DATATHON. 

## Tableau Dashboard

To view our dashboard, please click [here](https://public.tableau.com/shared/JT9Y79QFQ?:display_count=y&:origin=viz_share_link).

## Methodology and Overview

Before writing any code, we decided to enrich the provided data with the intention of creating an accurate simulation of the FIU student body, faculty, support staff, and administration. As a result, utilizing estimations and Google's mapping API's we plotted over 10,000 addresses across Miami-Dade and Broward County to depict the home locations of FIU's population. Additionally, we made sure to include relevant metadata to aid in the future task of risk profiling by adding factors of gender, age, household size, current cases (infections) by Zip-Code. These factors will be systematically supplied into our designed risk profiling index as depicted below: 

The results of our generated data can be visualized below:

![Map Image 1](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/Zoomed-Out-Focus.jpg)
![Map Image 2](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/FIU-MMC-Focus.jpg)

The full map is interactive and can be accessed entirely for features and navigation (Zoom-In/Zoom-Out) please download and open [map.html](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/map.html). 

The metadata utilized as the simulation of our "FIU Network" via Neo4j is shown below: 

![network image](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/neo4j-network.png)

### Python

The final Python code has been migrated to a Jupyter Notebook for ease of use and visualization. The full notebook can be accessed [here](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/python/simulation.ipynb)

This script serves to accomplish a variety of tasks of which include data generation, manipulation, cleansing, modification and export to files (.csv)


### SQL

For the [algorithm-join-script.sql](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/sql/algorithm-join-script.sql), we utilized SQL to initially clean the data by removing duplicate records. Next, we retrieved the highest capacity of a respective class and used this information to join the given FIU scheduling data.   

For the [wifi-script.sql](https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/sql/wifi-script.sql), we utilized SQL to combine the provided FIU network data and transform the time to an interpretable factor based on a 24 hour format scheme. 

## Tools and Technologies

<p align="center">
    <img src="https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/tableaulogo.png">
    <img src="https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/neo4j.png">
    <img src="https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/excel.jpg">
    <img src="https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/sql.png"> 
<br>
</br>    
    <img src="https://github.com/eitanflor/Monitoring-Risk-Profiles/blob/master/static/python.png">
</p>
