### Add US Census Region to Data ###
# sources: 
  ## 2010 Census: https://www.census.gov/geographies/reference-maps/2010/geo/2010-census-regions-and-divisions-of-the-united-states.html
  # as PDF: https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf
  # converted to csv: https://github.com/cphalpert/census-regions


# Initialize #

# Import libraries
library(data.table)
library(dplyr)

# set path variables
## change userPath to match your local machine!
userPath <- "C:/Users/mark/Box Sync/_MF/Studies/DATS 6101/"
dataPath <- paste(userPath, "DATS-6101-group-6/data/processed/", sep="")
setwd(dataPath)


# Import data #

# main dataset
df <- data.frame(read.csv("analytic_data_2016_2021.csv"))

# census region info
census_regions <- data.frame(read.csv("https://raw.githubusercontent.com/cphalpert/census-regions/master/us%20census%20bureau%20regions%20and%20divisions.csv"))
census_regions <- census_regions[2:4]
colnames(census_regions) <- c('state', 'region', 'division')


# Merge data #

# merge
df_reg <- merge(df, census_regions, by="state", all = TRUE)
str(df_reg)


# Data cleaning #

# identify missing data
df_mi <- df_reg %>% filter(is.na(region) | is.na(division)) %>% 
  select(year, state, statecode, county, countycode, fipscode, region, division)
df_mi

# find true values for missing obs
df_reg %>% filter(statecode==46 & countycode==113) %>% 
  select(state, statecode, county, countycode, region, division)

# values:
  ## state = "SD"
  ## county = "Shannon County"
  ## region = "Midwest"
  ## division = "West North Central"

# replace missing values
df_reg[df_reg$statecode==46 & df_reg$countycode==113,"state"] <- "SD"
df_reg[df_reg$statecode==46 & df_reg$countycode==113,"county"] <- "Shannon County"
df_reg[df_reg$statecode==46 & df_reg$countycode==113,"region"] <- "Midwest"
df_reg[df_reg$statecode==46 & df_reg$countycode==113,"division"] <- "West North Central"

# re-check missing data
df_mi <- df_reg %>% filter(is.na(region) | is.na(division)) %>% 
  select(year, state, statecode, county, countycode, fipscode, region, division)
df_mi

# reorder columns; put region and division first
df_reg <- df_reg %>% select(region, division, everything())
colnames(df_reg)

# new dimensions
print(paste(ncol(df_reg), "columns x",nrow(df_reg), "rows"))


# Export data #

# export combined data to processed folder
fwrite(df_reg, "analytic_data_2016_2021_with_regions.csv")
