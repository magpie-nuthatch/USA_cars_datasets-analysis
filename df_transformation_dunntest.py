import numpy as np
import pandas as pd
from df_visualisation_normality import normality
from df_descriptives import descriptives

df = pd.read_csv("csv_trans\\USA_cars_datasets_trans_postnormality.csv",
                 encoding='latin1',
                 sep = ";",
                 index_col = 0)

# This script specifically removes values for brand that occur less frequent than three times, to make a Dunn post-hoc test possible.

df_trans = df

df_trans.drop(df_trans[df_trans["brand"].isin(["lexus",
                                               "audi",
                                               "mazda",
                                               "toyota",
                                               "maserati",
                                               "lincoln",
                                               "acura"])].index,
                                               inplace = True)

descriptives(df_trans, 50)

df_trans.to_csv("csv_trans\\USA_cars_datasets_trans_dunntest.csv",
                sep=";")