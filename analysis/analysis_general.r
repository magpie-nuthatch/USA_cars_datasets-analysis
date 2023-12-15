### LOADING LIBRARIES
library(tidyverse) # Loads tidyverse packages, mainly for ggplot2
library(epitools) # Loads epitools package for odds ratio calculation

### SETTING OPTIONS
options(
  scipen = 999 # Turns off scientific notation
)

### SETTING WORKING DIRECTORY AND LOADING FILES
setwd(
  "~/T99/USA_cars_datasets-analysis" # Sets working directory
)
df <- read.csv(
  "USA_cars_datasets_trans_postnormality.csv", # Loads csv file as dataframe
  sep = ";" # Defines seperator used in csv file
)

### GATHERING DESCRIPTIVES OF DATAFRAME
head(df,
     n = 6
)
summary(df)
nrow(df)
ncol(df)

warnings()