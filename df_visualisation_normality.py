import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as stats


np.set_printoptions(suppress = True,
                    formatter = {'float_kind':'{:0.2f}'.format})

df = pd.read_csv("csv_trans\\USA_cars_datasets_trans_initial.csv",
                 encoding='latin1',
                 sep = ";",
                 index_col = 0)

def normality(df, bin_amount):
    for column in df:
        df_loop = df.dropna(subset = column)
        if df_loop[column].dtype != "object":
            try:
                fig = plt.figure(figsize = (10, 10))
                ax = fig.add_subplot(111)
                stats.probplot(df_loop[column],
                            plot = plt,
                            rvalue = True)
                ax.set_title(f"QQ Plot for {column}")
                plt.show()

                df_loop.plot(kind = "hist", 
                             y = column, 
                             bins = bin_amount, 
                             title = f"Histogram for {column}")
                plt.show()

                print()
                print(f"Statistical normality test for {column}")
                print(stats.normaltest(df_loop[column]))
                print()
                print(f"Descriptives for column {column}:")
                print(df_loop[column].describe())
            except:
                try:
                    print()
                    print(f"Statistical normality test for {column}")
                    print(stats.normaltest(df_loop[column]))
                    print()
                    print(f"Descriptives for column {column}:")
                    print(df_loop[column].describe())
                except:
                    pass
        else:
            pass