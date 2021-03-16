# Takes in tibble as input
# Outputs simple return


ret_calc <- function(dat = filter_df){

    col_num <- colnames(dat[, sapply(dat, is.numeric)])

    col_other <- colnames(dat)[!(colnames(dat) %in% col_num)]

    calc_df <- apply(dat[, col_num], 2, function(X){X/lag(X) - 1})

    out_df <- bind_cols(dat[, col_other], as_tibble(calc_df))

    out_df
}
