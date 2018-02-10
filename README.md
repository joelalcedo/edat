# edat
Efficient Data Aggregation with Tibbles

## Motivation
A conventional pitfall of combining API data one may encounter in the wild is best illustrated as such:

```
library(Quandl)
library(tidyverse)

tsla <- Quandl("WIKI/TSLA") %>% mutate(ticker = 'TSLA')
gm <- Quandl("WIKI/GM") %>% mutate(ticker = 'GM')
ford <- Quandl("WIKI/F") %>% mutate(ticker = 'F')

dataset <- rbind(tsla, gm)
dataset <- rbind(dataset, ford)
```

In this example, equity data for Tesla, General Motors, and Ford are all pulled separately, then bounded individually. This can become laborious as the number of data requests increase. 

Drawing from tidyverse paradigms, one can nest datasets into a a tibble using the logic below.

```
library(Quandl)
library(tidyverse)

dataset <- tribble(
  ~ticker, ~data,
  'TSLA', Quandl("WIKI/TSLA"),
  'GM', Quandl("WIKI/GM"),
  'F', Quandl("WIKI/F")
)
```
Please refer to the 'edat' file for the full code, which will provide you the methods to expand the nested table into a analysis-ready format.

Besides the benefit of improved scalability, I personally find it easier to read.

I hope this program does you well.
