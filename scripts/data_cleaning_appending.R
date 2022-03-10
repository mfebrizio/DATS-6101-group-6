# Cleaning and Appending Data #
# source: https://www.countyhealthrankings.org

# set path variables
## must change userPath to match your local machine!
userPath <- "C:/Users/mark/Box Sync/_MF/Studies/DATS 6101/"
dataPath <- paste(userPath, "DATS-6101-group-6/data/", sep="")

setwd(dataPath)

# load data for one year
df_year1 <- data.frame(read.csv('raw/file.csv'))

# INSERT data cleaning steps
## filter out unneccesary columns
## check and convert data types
## etc.

# append datasets using rbind() function
# each dataframe should have the same columns (including data types)
df_all <- rbind(df_year1, df_year2, df_year3, df_year4) ## add more years as necessary

# import library
library(data.table)

# export data to processed folder
fwrite(df_all, "processed/file.csv")

