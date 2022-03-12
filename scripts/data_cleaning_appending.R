### Cleaning and Appending Data ###
# source: https://www.countyhealthrankings.org


# Initialize #

# Import libraries
library(readr)
library(dplyr)
library(data.table)

# set path variables
## change userPath to match your local machine!
userPath <- "C:/Users/mark/Box Sync/_MF/Studies/DATS 6101/"
dataPath <- paste(userPath, "DATS-6101-group-6/data/", sep="")
setwd(dataPath)


# Load Raw Data #

# import library
#library(readr)

# list of csv files to load
csv_files <- list.files('raw/', pattern = "[_0]?.csv$")
csv_files <- csv_files[5:length(csv_files)]  ## select only years 2016 and on

# empty list to append dataframes
dataframe_list <- list()

# for loop to process each year's data
# load dataframe, clean the data, 
for (i in seq_along(csv_files)) {
  
  # load data for one year
  # use colnames = FALSE so R doesn't have to convert column names
  df <- read_csv(paste('raw/', csv_files[i] , sep=''), col_names = F)
  
  # the column name is the second row after the header (if not using read_csv default)
  # use that for cleaner colnames
  colname_vector <- c(df[2,])
  colnames(df) <- colname_vector
  df <- df[-c(1, 2), ]
  
  # import library
  #library(dplyr)
  
  # columns to use for analysis
  keep_cols <- c('statecode', 'countycode', 'fipscode', 'state', 'county', 'year', 'county_ranked',  ## id vars
                 'v042_rawvalue', 'v145_rawvalue',  ## mental health measures
                 'v044_rawvalue',  ## income inequality measure
                 'v063_rawvalue', 'v021_rawvalue', 'v069_rawvalue', 'v023_rawvalue',  ## economic controls
                 'v024_rawvalue', 'v082_rawvalue', 'v136_rawvalue', 'v133_rawvalue', 
                 'v062_rawvalue', 'v062_other_data_1',  ## controls for mental health provision
                 'v051_rawvalue', 'v052_rawvalue', 'v054_rawvalue', 'v055_rawvalue',  ## demographic controls
                 'v081_rawvalue', 'v080_rawvalue', 'v056_rawvalue', 'v126_rawvalue', 
                 'v057_rawvalue', 'v058_rawvalue'
                 )
  
  # filter dataset with select()
  df_filter <- df %>% select(all_of(keep_cols))
  
  
  # change column names
  ## identify which colnames to change
  change_colnames <- colnames(df_filter[-c(1:7)])
  
  # set new colnames
  new_colnames <- c('mental_health_days', 'mental_distress_rate', 
                    'inequality', 
                    'median_inc', 'hs_grad', 'college', 'unempl', 
                    'child_poverty', 'single_parent', 'severe_housing', 'food_index', 
                    'mh_providers', 'pop_provider_ratio', 
                    'pop', 'pct_below18', 'pct_black', 'pct_native_am', 
                    'pct_asian', 'pct_pacific', 'pct_hispanic', 'pct_white', 
                    'pct_female', 'pct_rural'
                    )
  
  # import library
  #library(data.table)
  
  # rename columns with new_colnames vector
  if (length(change_colnames)== length(new_colnames)) {
    setnames(df_filter, old=change_colnames, new=new_colnames)
    print('Renamed columns!')
  
  } else {
    print('New column names and slice do not align.')
  }
  
  # convert columns from char to numeric
  df_filter[new_colnames] <- lapply(df_filter[new_colnames], as.numeric)
  
  # append dataframe to list
  dataframe_list[[i]] <- df_filter
  
}


# Combine Annual Datasets #

# create empty dataframe to append data
df_all <- data.frame()

# append datasets using rbind() function
# each dataframe should have the same columns (including data types)
for (df in dataframe_list){
  df_all <- rbind(df_all, df)

}


# Export Processed Data #

# import library
#library(data.table)

# export combined data to processed folder
fwrite(df_all, "processed/analytic_data_2016_2021.csv")

