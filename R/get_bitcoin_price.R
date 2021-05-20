#' This returns the current price of bitcoins in US dollars
#' @export
#' @importFrom logger log_info log_error
#' @importFrom binancer binance_coins_prices
#' @import data.table
get_bitcoin_price <- function() {
  tryCatch({
    btcusdt <- binancer::binance_coins_prices()[symbol == 'BTC']
    logger::log_info('The current Bitcoin price is ${btcusdt}')
    btcusdt
  },
  error = function(e) {
    logger::log_error(e$message)
    Sys.sleep(1)
    get_bitcoin_price()
  })
}