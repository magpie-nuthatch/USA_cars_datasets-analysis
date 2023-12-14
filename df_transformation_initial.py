import numpy as np
import os
import pandas as pd
from df_descriptives import descriptives

os.chdir(os.path.dirname(os.path.abspath(__file__))) # Set working directory to directory of current script

# Load csv file as dataframe

df = pd.read_csv("USA_cars_datasets.csv",
                 encoding='latin1',
                 sep = ",",
                 index_col = 0)

descriptives(df,
             20)

# Drop unneeded columns

df_trans = df.drop(df.columns[[4, 7, 8, 10]],
                   axis = 1)

descriptives(df_trans, 
             20)

# Drop values where price is 0

for value in df_trans["price"]:
    if value == 0:
        df_trans["price"].replace(value, np.nan, 
                                  inplace = True)

# Drop values where mileage is 0

for value in df_trans["mileage"]:
    if value == 0:
        df_trans["mileage"].replace(value, np.nan, 
                                    inplace = True)

# Drop rows where brand = "harley-davidson"

df_trans.drop(df_trans[df_trans["brand"].isin(["harley-davidson"])].index,
              inplace = True)

# Drop rows where model = "door"

df_trans.drop(df_trans[df_trans["model"].isin(["door"])].index,
              inplace = True)

# Drop rows where condition = "listing expired"

df_trans.drop(df_trans[df_trans["condition"].isin(["Listing Expired"])].index,
              inplace = True)

# Create new column with simpler names for colors

colorlist = []
for color in df_trans["color"]:
    if "beige" in color:
        colorlist.append("beige")
    elif "silver" in color:
        colorlist.append("silver")
    elif "black" in color:
        colorlist.append("black")
    elif "blue" in color:
        colorlist.append("black")
    elif "white" in color or "off-white" in color:
        colorlist.append("white")
    elif "brown" in color:
        colorlist.append("white")
    elif "red" in color or "crimson" in color:
        colorlist.append("red")
    elif "orange" in color:
        colorlist.append("orange")
    elif "gold" in color:
        colorlist.append("gold")
    elif "gray" in color or "charcoal" in color:
        colorlist.append("gray")
    elif "green" in color:
        colorlist.append("green")
    elif "purple" in color:
        colorlist.append("purple")
    elif "turquoise" in color:
        colorlist.append("turquoise")
    elif "yellow" in color:
        colorlist.append("yellow")
    else:
        colorlist.append(None)
    
df_trans["color_simple"] = colorlist

# Create new column with tighter categories for listings/conditions

conditionlist = []
for condition in df_trans["condition"]:
    if "minutes" in condition or "hours" in condition:
        conditionlist.append("Less than one day left")
    elif "7 days left" in condition or "8 days left" in condition or "9 days left" in condition:
        conditionlist.append("More than one week left")
    else:
        conditionlist.append(condition)

df_trans["condition_simple"] = conditionlist

descriptives(df_trans, 
             50)

# Drop old columns

df_trans = df_trans.drop(df_trans.columns[[5, 7]],
                         axis = 1)

descriptives(df_trans, 
             50)