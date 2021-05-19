#' This returns the current price of bitcoins in dollars
#' @examples
#' get_bitcoin_price()
get_bitcoin_price <- function() {
  tryCatch({
    btcusdt <- binance_coins_prices()[symbol == 'BTC', usd]
    assert_number(btcusdt, lower = 1000)
    log_info('The current Bitcoin price is ${btcusdt}')
    btcusdt
  },
  error = function(e) {
    log_error(e$message)
    Sys.sleep(1)
    get_bitcoin_price()
  })
}