library(Quandl)
library(tidyverse)
library(tibble)

#all you need to do is add tickers to the data below
dataset <- tribble(
  ~ticker, ~data,
  'TSLA', Quandl("WIKI/TSLA"),
  'GM', Quandl("WIKI/GM"),
  'F', Quandl("WIKI/F")
)

#run the loop to join into long format to then analyze further
longdata <- NULL
for (i in 1:nrow(dataset)){
  tempdf <- dataset$data[[i]] %>% mutate(ticker = dataset$ticker[[i]])
  longdata <- rbind(tempdf, longdata)
  rm(tempdf)
}

#organize columns
longdata <- longdata %>% select(Date, ticker, everything())