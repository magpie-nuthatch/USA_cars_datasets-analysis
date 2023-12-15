### LOADING LIBRARIES
library(tidyverse) # Loads tidyverse packages, mainly for ggplot2
library(epitools) # Loads epitools package for odds ratio calculation

### SETTING OPTIONS
options(
  scipen = 999 # Turns off scientific notation
)

### SETTING WORKING DIRECTORY AND LOADING FILES
setwd(
  "~/T99/USA_cars_datasets-analysis")
df <- read.csv(
  "csv_trans\\USA_cars_datasets_trans_postnormality.csv",
  sep = ";")

### GATHERING DESCRIPTIVES OF DATAFRAME
head(df,
     n = 6)
summary(df)
nrow(df)
ncol(df)

price <- df$price
brand <- df$brand
model <- df$brand
year <- df$brand
mileage <- df$mileage
state <- df$state
color_simple <- df$color_simple
condition_simple <- df$condition_simple



warnings()