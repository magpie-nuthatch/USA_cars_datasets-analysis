### LOADING LIBRARIES
library(tidyverse)
library(dunn.test)

### SETTING OPTIONS
options(
  scipen = 999 # Turns off scientific notation
)

### SETTING WORKING DIRECTORY AND LOADING FILES
setwd(
  "~/T99/USA_cars_datasets-analysis")
df <- read.csv(
  "csv_trans\\USA_cars_datasets_trans_dunntest.csv",
  sep = ";")

### GATHERING DESCRIPTIVES OF DATAFRAME
head(df,
     n = 6)
summary(df)
nrow(df)
ncol(df)

price <- df$price
brand <- df$brand
model <- df$model
year <- df$year
mileage <- df$mileage
state <- df$state
color_simple <- df$color_simple
condition_simple <- df$condition_simple

# Kruskal-Wallis test and Dunn post-hoc test. Dunn post hoc tests requires a minimum of 3 values per category in x variable

kruskal_wallis <- kruskal.test(price ~ brand, 
                               data = df)

kruskal_wallis

kruskal_wallis_dunn <- dunn.test(price,
                                 g = brand,
                                 method = "bonferroni",
                                 list = TRUE)

kruskal_wallis_dunn

# Warnings

warnings()