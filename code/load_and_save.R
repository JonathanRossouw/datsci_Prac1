
# Loads data from package and saves to data file
# Package name, data file name and saved file name all inputs
# Default is fmxdat::BRICSTRI saved as dat_ex.rds in data file

load_save_data_func <- function(package_name = "fmxdat", data_name = "BRICSTRI", file_name = "dat_ex"){

    if (!require(package_name, character.only = TRUE)) install.packages(package_name)

    library(package_name, character.only = TRUE)
    df <- get(data_name)

    write_rds(x = df, file = paste0("data/", file_name, ".rds") )

}

