#' This function returns exchange rates from any two currencies at the given period 
#' @param currency1 first currency, default USD
#' @param currency2 2nd currency, default EUR
#' @param initial_date initial date, default 30 days ago
#' @param final_date final date, default EUR
#' @export
#' @importFrom httr GET
#' @import data.table
#' @example get_exchange_rates(currency1 = 'USD', currency2 = 'HUF', 
#' initial_date = "2021-03-20", 
#' final_date = "2021-04-20")
get_exchange_rates <- function(currency1 = 'USD', currency2 = 'EUR', 
                               initial_date = Sys.Date() - 30, 
                               final_date = Sys.Date()){
  response <- httr::GET(
    'https://api.exchangerate.host/timeseries',
    query = list(
      start_date = initial_date,
      end_date   = final_date,
      base       = currency1,
      symbols    = currency2
    ))
  exchange_rates <- content(response)
  exchange_rates <- exchange_rates$rates
  rates_table <- data.table(
    date = as.Date(names(exchange_rates)),
    usdhuf = as.numeric(unlist(exchange_rates)))
  rates_table
}