import pandas as pd
import os

os.chdir(os.path.dirname(os.path.abspath(__file__))) # Set working directory to directory of current script

df = pd.read_csv("USA_cars_datasets.csv",
                 encoding='latin1',
                 sep = ",",
                 index_col = 0)

def descriptives(df, unique_values_amount):
    print()
    print(f"Information on columns in current dataframe:")
    print(df.info())

    for column in df:
        df_loop = df.dropna(subset = column)
        print()
        print(f"Descriptives for column {column}:")
        print(df_loop[column].describe())
        if df_loop[column].dtype == "object" and len(df_loop[column].unique()) < unique_values_amount: # Displays all unique values for columns with less than predefined amount of unique values
            unique_values = sorted(df_loop[column].unique())
            print()
            print(f"Unique values in column {column}:")
            for value in unique_values:
                print(value)
            print()
            print(f"Value counts for column {column}:")
            print(f"{df[column].value_counts()}")
        print()

descriptives(df, 30)