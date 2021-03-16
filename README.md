Purpose
=======

The aim of this folder is to complete Prac1 of the Data Science of
Finance and Economics module. <br> In this folder I will create
functions in order to:
<ol>
<li>
Create a function that loads and saves fmxdat::BRICSTRI in your data
folder - saved as a .rds file, with name: BRICS.rds
</li>
</ol>
In a different chunk in your README:
<ol start="2">
<li>
Load BRICS.rds, and save this as ‘df\_Brics’ in your environment.
</li>
<li>
Next, create a new chunk where you source a function, ‘filter\_df.R’,
that does the following:
</li>
</ol>
<ol type="a">
<li>
filter your dataframe to only consider weekdays between two dates (set
by default to 2008 and 2010.
</li>
<ul>
<li>
Hint. use: rmsfuns::dateconverter and filter the rows using ‘which’.
</li>
</ul>
<li>
Create and source a function that calculates the simple returns
Xlag(X)−1 for all the columns in your dataframe.
</li>
</ol>

Lastly, place this project on github and call it: datsci\_Prac1.

### Load in coding scripts

``` r
rm(list = ls()) # Clean your environment:
gc() # garbage collection - It can be useful to call gc after a large object has been removed, as this may prompt R to return memory to the operating system.
```

    ##          used (Mb) gc trigger (Mb) limit (Mb) max used (Mb)
    ## Ncells 403317 21.6     829448 44.3         NA   657874 35.2
    ## Vcells 761031  5.9    8388608 64.0      16384  1802321 13.8

``` r
library(pacman)
p_load(tidyverse, rmsfuns)

# Source in all your functions:
list.files('code/', full.names = T, recursive = T) %>% as.list() %>% walk(~source(.))
```

Data loading
------------

Loading, saving and reading in fmxdat::BRICSTRI data file

``` r
load_save_data_func(package_name = "fmxdat", data_name = "BRICSTRI", file_name = "dat_BRICSTRI")
```

    ## Loading required package: fmxdat

``` r
df_Brics <- read_rds(file = "data/dat_BRICSTRI.rds")
```

Filtering Data
--------------

Filtering out all weekdays between 2008 and 2010.

``` r
filter_df <- filter_func(dat = df_Brics, start_date = as.Date("2008-01-01"), end_date = as.Date("2010-12-31"))
```

Calculating Returns
-------------------

Calculate simple return in the form X/lagX - 1.

``` r
ret_df <- ret_calc(dat = filter_df)
head(ret_df)
```

    ## # A tibble: 6 x 6
    ##   Date           brz      chn      ind     rus     zar
    ##   <date>       <dbl>    <dbl>    <dbl>   <dbl>   <dbl>
    ## 1 2008-01-04 NA      NA       NA       NA      NA     
    ## 2 2008-01-11  0.0153 -0.0122  -0.00406  0.0143 -0.0209
    ## 3 2008-01-18 -0.0989 -0.0924  -0.0837  -0.0789 -0.0671
    ## 4 2008-01-25  0.0156 -0.0278  -0.0511  -0.0466 -0.0332
    ## 5 2008-02-01  0.0760 -0.0435  -0.0153  -0.0179  0.0275
    ## 6 2008-02-08 -0.0357 -0.00541 -0.0497  -0.0584 -0.0893
