import numpy as np
import pandas as pd
from df_visualisation_normality import normality
from df_descriptives import descriptives

df = pd.read_csv("csv_trans\\USA_cars_datasets_trans_initial.csv",
                 encoding='latin1',
                 sep = ";",
                 index_col = 0)

#normality(df, 50)

df_trans = df

# Remove outliers for price above 60000

for value in df_trans["price"]:
    if value < 50 or value > 75000:
        df_trans["price"].replace(value, np.nan, 
                                  inplace = True)
        
# Remove outliers for mileage above 70000

for value in df_trans["mileage"]:
    if value < 100 or value > 100000:
        df_trans["mileage"].replace(value, np.nan, 
                                     inplace = True)
        
normality(df_trans, 50)

descriptives(df_trans, 50)

df_trans.to_csv("csv_trans\\USA_cars_datasets_trans_postnormality.csv",
                sep=";")