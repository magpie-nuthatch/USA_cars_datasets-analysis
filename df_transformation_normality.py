import numpy as np
import pandas as pd
from df_visualisation_normality import normality

df = pd.read_csv("csv_trans\\USA_cars_datasets_trans_initial.csv",
                 encoding='latin1',
                 sep = ";",
                 index_col = 0)

normality(df, 30)