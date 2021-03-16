# Takes a tibble of time series data as input
# Outpus tibble with all rows falling on weekdays

filter_func <- function(dat = df_Brics, start_date = as.Date("2008-01-01"), end_date = as.Date("2010-12-31")){

    week_days <- rmsfuns::dateconverter(StartDate = start_date, EndDate = end_date, Transform = "weekdays")

    week_dat <- dat[which(dat$Date %in% week_days), ]

    week_dat
}

