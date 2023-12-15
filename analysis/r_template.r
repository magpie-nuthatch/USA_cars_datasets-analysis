### LOADING LIBRARIES
library(tidyverse) # Loads tidyverse packages, mainly for ggplot2
library(epitools) # Loads epitools package for odds ratio calculation

### SETTING OPTIONS
options(
  scipen = 999 # Turns off scientific notation
)

### SETTING WORKING DIRECTORY AND LOADING FILES
setwd(
  "~/T99/Templates" # Sets working directory
)
df <- read.csv(
  "csv_template.csv", # Loads csv file as dataframe
  sep = ";" # Defines seperator used in csv file
)

### GATHERING DESCRIPTIVES OF DATAFRAME
head(df, # Shows head of dataframe
     n = 6 # Sets number of rows shown as head of dataframe, default is 6
)
summary(df) # Shows descriptives of variables in dataframe
nrow(df) # Shows total count of observations (rows) in dataframe
ncol(df) # Shows total count of columns in dataframe

### DATA VISUALIZATION
x_var <- df$x # Defines x as specific column of dataframe
y_var <- df$y # Defines y as specific column of dataframe
z_var <- df$z # Defines z as specific column of dataframe

## BASIC PLOTS
# BASIC/AUTOMATIC PLOT
plot_basic <- plot(x = x_var, # Sets x as pre-defined vector
                   y = y_var, # Sets y as pre-defined vector
                   main = "Title", 
                   sub = "Subtitle", 
                   xlab = "Title x axis", 
                   ylab = "Title y axis"
)

plot_basic

# BASIC PLOT, SCATTERPLOT
scatterplot_basic <- plot(x = x_var, # Sets x as pre-defined vector
                          y = y_var, # Sets y as pre-defined vector
                          type = p, # Sets graph type as points
                          main = "Title", 
                          sub = "Subtitle", 
                          xlab = "Title x axis", 
                          ylab = "Title y axis"
)

scatterplot_basic

# BASIC PLOT, LINES GRAPH
lines_basic <- plot(x = x_var, # Sets x as pre-defined vector
                    y = y_var, # Sets y as pre-defined vector
                    type = l, # Sets graph type as lines
                    main = "Title", 
                    sub = "Subtitle", 
                    xlab = "Title x axis", 
                    ylab = "Title y axis"
)

lines_basic

# BASIC PLOT, SCATTERPLOT AND LINES
scatterplot_and_lines_basic <- plot(x = x_var, # Sets x as pre-defined vector
                                    x = y_var, # Sets y as pre-defined vector
                                    type = b, # Sets graph type as both points and lines
                                    main = "Title", 
                                    sub = "Subtitle", 
                                    xlab = "Title x axis", 
                                    ylab = "Title y axis"
)

scatterplot_and_lines_basic

# BASIC PLOT, BAR CHART
barchart_basic <- plot(x = x_var, # Sets x as pre-defined vector
                       y = y_var, # Sets y as pre-defined vector
                       type = h, # Sets graph type as high-density/histogram
                       main = "Title", 
                       sub = "Subtitle", 
                       xlab = "Title x axis", 
                       ylab = "Title y axis"
)

barchart_basic

# BASIC PLOT, HISTOGRAM
histogram_basic <- plot(x = x_var, # Sets x as pre-defined vector
                        type = h, # Sets graph type as high-density/histogram
                        main = "Title", 
                        sub = "Subtitle", 
                        xlab = "Title x axis", 
                        ylab = "Title y axis"
)

histogram_basic

## GGPLOT2 PLOTS
colours() # List available color names

# SCATTERPLOT IN GGPLOT
scatterplot <- ggplot(data = df, # Selects dataframe
                      aes(x = x_var,
                          y = y_var
                          ) # Selects x and y variables
) + 
geom_point(color = "black", # Sets color for border of points as name, hex code or z variable name
           fill = "white",  # Sets color for filling of points as name, hex code or z variable name
           shape = "circle filled", # Sets shape for points, as integer or string
           size = 3, # Sets size of points
           na.rm = TRUE, # Quietly removes missings from data
           show.legend = TRUE # Shows legend of variables
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

scatterplot

# BAR CHART IN GGPLOT, WITH HEIGHT DEFINED BY COUNT OF X
barchart_count <- ggplot(data = df, # Selects dataframe
                         aes(x = x_var,
                             y = y_var
                             ) # Selects x and y variables
) + 
geom_bar(color = "black", # Sets color for border of boxes as name, hex code or x variable name
         fill = "white",  # Sets color for filling of boxes as name, hex code or x variable name
         linewidth = 10, # Sets width of border of boxes
         lineend = "square", # Sets roundness of border of boxes
         na.rm = TRUE, # Quietly removes missings from data
         show.legend = TRUE # Shows legend of variables
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

barchart_count

# BAR CHART IN GGPLOT, WITH HEIGHT DEFINED BY VALUE OF X
barchart_value <- ggplot(data = df, # Selects dataframe
                         aes(x = x_var,
                             y = y_var
                             ) # Selects x and y variables
) + 
geom_col(color = "black", # Sets color for border of boxes as name, hex code or x variable name
         fill = "white",  # Sets color for filling of boxes as name, hex code or x variable name
         linewidth = 10, # Sets width of border of boxes
         lineend = "square", # Sets roundness of border of boxes
         na.rm = TRUE, # Quietly removes missings from data
         show.legend = TRUE # Shows legend of variables
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

barchart_value

# BOXPLOT IN GGPLOT
boxplot <- ggplot(data = df, # Selects dataframe
                  aes(x = x_var,
                      y = y_var
                      ) # Selects x and y variables
) + 
geom_boxplot(color = "black", # Sets color for border of box as name, hex code or x variable name
             fill = "white",  # Sets color for filling of box as name, hex code or x variable name
             outlier.color = "red", # Sets color for border of outliers
             outlier.fill = "pink", # Sets color for filling of outliers
             outlier.shape = "circle filled", # Sets shape for outliers, as integer or string
             outlier.size = 1, # Sets size for outliers
             notch = FALSE, # Choose whether or not box plot has a notch
             notchwidth = 0, # If applicable, sets width of notch
             na.rm = TRUE, # Quietly removes missings from data
             orientation = x, # Chooses orientation of boxplot as vertical (x) or horizontal (y)
             show.legend = TRUE # Shows legend of variables
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

boxplot

# HISTOGRAM IN GGPLOT
histogram <- ggplot(data = df, # Selects dataframe
                    aes(x = x_var,
                        y = y_var
                        ) # Selects x and y variables
) + 
geom_histogram(color = "black", # Sets color for border of box, as name, hex code or x variable name
               fill = "white",  # Sets color for border of box, as name, hex code or x variable name
               bins = 10, # Selects number of boxes
               na.rm = TRUE, # Quietly removes missings from data
               orientation = x, # Chooses orientation of histogram as vertical (x) or horizontal (y)
               show.legend = TRUE # Shows legend of variables
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

histogram

# VIOLINPLOT IN GGPLOT
violinplot <- ggplot(data = df, # Selects dataframe
                     aes(x = x_var,
                         y = y_var
                         ) # Selects x and y variables
) + 
geom_violin(color = "black", # Sets color for border of violin, as name, hex code or x variable name
            fill = "white",  # Sets color for border of violin, as name, hex code or x variable name
            trim = TRUE, # Trims violin tails to range of data
            scale = "count", # Scales areas of violins proportionally to number of observations, select "area" for same areas for all violins 
            na.rm = TRUE, # Quietly removes missings from data
            orientation = x, # Chooses orientation of histogram as vertical (x) or horizontal (y)
            show.legend = TRUE # Shows legend of variables
) +
stat_summary(fun.data = mean_sdl,
             geom = "pointrange" # Adds median and percentiles to violins
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

violinplot

# LINE GRAPH IN GGPLOT
linegraph <- ggplot(data = df, # Selects dataframe
                    aes(x = x_var,
                        y = y_var
                    ) # Selects x and y variables
) + 
geom_line(color = "black",
          linetype = "solid", # Selects line as solid, dashed, dotted, dotdash, longdash or twodash
          linewidth = 1, # Selects width of line
          na.rm = TRUE # Quietly removes missings from data
          orientation = x, # Chooses orientation of histogram as vertical (x) or horizontal (y)
          show.legend = TRUE # Shows legend of variables
) +
labs(title = "Title",
     subtitle = "Subtitle",
     caption = "Caption",
     tag = "Tag",
     x = "Title x axis",
     y = "Title y axis",
)

linegraph

### STATISTICAL ANALYSIS OF DATA
## ODDS RATIO
or <- oddsratio(x = x_var,
                y = y_var,
                conf.level = 0.95, # Set confidence interval level
                verbose = TRUE # Makes results more detailed
)

or

## SPEARMAN RHO
spearman_rho <- cor.test(x = x_var,
                         y = y_var,
                         alternative = "two.sided", # Selects type of hypothesis testing
                         method = "spearman", # Selects method of correlation testing
                         conf.level = 0.95, # Set confidence interval level
)

spearman_rho

## PEARSON R
pearson_r <- cor.test(x = x_var,
                      y = y_var,
                      alternative = "two.sided", # Selects type of hypothesis testing
                      method = "pearson", # Selects method of correlation testing
                      conf.level = 0.95, # Set confidence interval level
)

pearson_r

## LOGISTIC REGRESSION


## LINEAR REGRESSION


## WILCOXON TEST / WILCOXON SIGNED RANK TEST
wilcoxon_signed_rank <- wilcox.test(x = x_var,
                                    y = y_var,
                                    alternative = "two.sided", # Selects type of hypothesis testing
                                    paired = TRUE, # Set pairing of vectors to true, selecting the signed rank test
                                    conf.level = 0.95 # Set confidence interval level
)

wilcoxon_signed_rank

# POST HOC
wilcoxon_signed_rank_dunn <- dunn.test(x = x_var,
                                       g = y_var, # Selects y variable as groups
                                       list = TRUE, # Displays output as list
)

wilcoxon_signed_rank_dunn

## CHI SQUARE TEST
chi_square <- chisq.test(x = x_var,
                         y = y_var,
                         simulate.p.value = FALSE, # Turns Monte Carlo simulation off
                         B = 10000 # Sets number of simulations if Monte Carlo simulation is turned on
)

chi_square

# POST HOC
chisquare_or <- oddsratio(x = x_var,
                          y = y_var,
                          conf.level = 0.95, # Set confidence interval level
                          verbose = TRUE # Makes results more detailed)
)

chisquare_or

## MANN-WHITNEY U / TWO-SAMPLES WILCOXON TEST / WILCOXON RANK SUM TEST
wilcoxon_rank_sum <- wilcox.test(x = x_var,
                                 y = y_var,
                                 alternative = "two.sided", # Selects type of hypothesis testing
                                 paired = FALSE, # Set pairing of vectors to false, selecting the rank sum test
                                 conf.level = 0.95 # Set confidence interval level
)

wilcoxon_rank_sum

# POST HOC
wilcoxon_rank_sum_dunn <- dunn.test(x = x_var,
                                    g = y_Var, # Selects y variable as groups
                                    list = TRUE, # Displays output as list
)

wilcoxon_rank_sum_dunn

## FRIEDMAN TEST / FRIEDMAN ANOVA
friedman <- friedman.test(y = y_var, # Selects y variable
                          groups = x_var, # Selects x variable as groups
                          blocks = z_var # Selects z variable as blocks
)

friedman

# POST HOC
friedman_wilcoxon_signed_rank <- wilcox.test(x = x_var,
                                             y = y_var,
                                             alternative = "two.sided", # Selects type of hypothesis testing
                                             paired = TRUE, # Set pairing of vectors to true, selecting the signed rank test
                                             conf.level = 0.95 # Set confidence interval level
)

friedman_wilcoxon_signed_rank

## KRUSKAL-WALLIS TEST
kruskal-wallis <- kruskal.test(x = x_var, # Selects x variable
                               y = y_var, # Selects y variable as groups
)

kruskall-wallis

# POST HOC
kruskall-wallis_dunn <- dunn.test(x = x_var,
                                  g = y_Var, # Selects y variable as groups
                                  list = TRUE, # Displays output as list
)

kruskall-wallis_dunn

## DEPENDENT T TEST
dependent_t <- t.test(x = x_var,
                      y = y_var,
                      alternative = "two.sided", # Selects type of hypothesis testing
                      paired = TRUE, # Set pairing of vectors to true, selecting dependent t test
                      conf.level = 0.95 # Set confidence interval level
)

dependent_t

# POST HOC
dependent_t_cohen_d <- cohens_d(data = df,
                                formula = x_var ~ y_var,
                                paired = TRUE, # Set pairing of vectors to true, selecting dependent t test
                                var.equal = FALSE, # No equality of variances
                                conf.level = 0.95, # Set confidence interval level
                                ci = FALSE, # Turns bootstrapping off
                                nboot = 10000 # Select amount of replications for bootstrapping if turned on
)

dependent_t_cohen_d

## INDEPENDENT T TEST
independent_t <- t.test(x = x_var,
                        y = y_var,
                        alternative = "two.sided", # Selects type of hypothesis testing
                        paired = FALSE, # Set pairing of vectors to false, selecting independent t test
                        conf.level = 0.95 # Set confidence interval level
)

independent_t

# POST HOC
independent_t_cohen_d <- cohens_d(data = df
                                  formula = x_var ~ y_var,
                                  paired = FALSE, # Set pairing of vectors to false, selecting independent t test
                                  var.equal = TRUE, # Equality of variances
                                  conf.level = 0.95, # Set confidence interval level
                                  ci = FALSE, # Turns bootstrapping off
                                  nboot = 10000 # Select amount of replications for bootstrapping if turned on
)

independent_t_cohen_d


## INDEPENDENT MEASURES ONE-WAY ANOVA



## REPEATED MEASURES ONE-WAY ANOVA



## TWO-WAY MIXED ANOVA



## ONE-WAY ANCOVA / ONE-WAY COVARIANCE ANOVA



### WARNINGS
warnings()