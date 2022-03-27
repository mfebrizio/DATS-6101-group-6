# DATS-6101-group-6

Github repository for team 6 of Professor Edwin Lo's Spring 2022 DATS 6101 course.

## Initial Housekeeping

I created a .gitignore file with the R template and selected the MIT License – a fairly permissive license for the project.

Alex created a [page on OneNote](https://gwu0.sharepoint.com/sites/22SP_Dats6101_10M-GRP/_layouts/OneNote.aspx?id=%2Fsites%2F22SP_Dats6101_10M-GRP%2FSiteAssets%2F22SP_Dats6101_10M-GRP%20Notebook&wd=target%28_Collaboration%20Space%2FT6.one%7CECA6BC36-B95B-4F1F-833F-FD766D4E165F%2FTeam%20Project%20Brainstorm%7CB92533EC-1CA9-49E2-BD6E-C012CE298887%2F%29) for brainstorming project ideas.

## Repository Contents

*To do: insert discussion of contents*

## Project Description

### Topic Proposal

While many scholars have studied the relationship between income inequality and human health, less research has focused on income inequality and people’s mental health. An initial literature review suggests that the relationship between income inequality and mental health has not been conclusively answered ([Tibber et al. 2022](https://doi.org/10.1007/s00127-021-02159-w)). Therefore, this issue is worthy of further study.

Given the potential differences in effects by geographic area, focusing on how the relationship between income inequality and mental health varies across parts of the U.S. would be valuable. We are asking the following SMART question:

*What is the relationship between the prevalence of mental health problems and income inequality across U.S. counties from 2016 to 2021?*

Our independent variable for [measuring income inequality](https://www.countyhealthrankings.org/explore-health-rankings/measures-data-sources/county-health-rankings-model/health-factors/social-and-economic-factors/income/income-inequality) is the "ratio of household income at the 80th percentile to income at the 20th percentile." Our dependent variable, the [rate of frequent mental distress](https://www.countyhealthrankings.org/explore-health-rankings/measures-data-sources/county-health-rankings-model/health-outcomes/quality-of-life/frequent-mental-distress), is the "percentage of adults reporting 14 or more days of poor mental health per month."

Our dataset combines annual datasets tracking county-level public health data, containing approximately 19,000 observations in total. The specific timeframe of 2016-2021 provides the most complete data for our dependent and independent variables.

Source of data sets: RWJF County Health Rankings; [2016-2019](https://www.countyhealthrankings.org/explore-health-rankings/rankings-data-documentation/national-data-documentation-2010-2019); [2020-2021](https://www.countyhealthrankings.org/explore-health-rankings/rankings-data-documentation)

### Variables

In addition to our dependent variables (mental health) and independent variable of interest (income inequality), we are planning on incorporating other socioeconomic and demographic variables that may affect the relationship we are studying. The following variables were collected from our data source and compiled across 6 report years. 

* `region`: name of the US Census Bureau region (name)
* `division`: name of the US Census Bureau division (contained with a census region)
* `state`: state abbreviation
* `statecode`: FIPS state code
* `countycode`: FIPS county code
* `fipscode`: 5-digit FIPS Code (county-level); combines `statecode` and `countycode`
* `county`: county name
* `year`: report release year from [County Health Rankings](https://www.countyhealthrankings.org/); range of 2016-2021
* `county_ranked`: Indicates whether or not the county was ranked; 0=unranked, 1=ranked, or NA for aggregated national or state-level data
* `mental_health_days`: Average number of mentally unhealthy days reported in past 30 days (age-adjusted)
* `mental_distress_rate`: Percentage of adults reporting 14 or more days of poor mental health per month
* `inequality`: Ratio of household income at the 80th percentile to income at the 20th percentile (Income inequality)
* `median_inc`: The income where half of households in a county earn more and half of households earn less
* `hs_grad`: Percentage of adults ages 25 and over with a high school diploma or equivalent
* `college`: Percentage of adults ages 25-44 with some post-secondary education
* `unempl`: Percentage of population ages 16 and older unemployed but seeking work
* `child_poverty`: Percentage of people under age 18 in poverty
* `single_parent`: Percentage of children that live in a household headed by single parent
* `severe_housing`: Percentage of households with severe housing problems
* `food_index`: Index of factors that contribute to a healthy food environment, from 0 (worst) to 10 (best)
* `mh_providers`: rate of providers to 100,000 population
* `pop_provider_ratio`: ratio of population to mental health providers (i.e., population served per provider)
* `pop`: census population estimate
* `pct_below18`: percent of population younger than 18
* `pct_black`: percent of population that are African-American or non-Hispanic Black
* `pct_native_am`: percent of population that are Native American or Alaska Natives
* `pct_asian`: percent of population that are Asian
* `pct_pacific`: percent of population that are Native Hawaiian or Other Pacific Islander
* `pct_hispanic`: percent of population that are Hispanic
* `pct_white`: percent of population that are non-Hispanic white or Caucasian
* `pct_female`: percent of population that are female
* `pct_rural`: percent of population that live in rural areas

For more information, see [the measures online](https://www.countyhealthrankings.org/explore-health-rankings/measures-data-sources/2021-measures).
