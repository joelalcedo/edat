# edat
Efficient Data Aggregation with Tibbles

## Motivation
To prevent a conventional pitfall associated with merging api-sourced datasets.

Inefficient Example:

```
library(Quandl)
library(tidyverse)

tsla <- Quandl("WIKI/TSLA") %>% mutate(ticker = 'TSLA')
gm <- Quandl("WIKI/GM") %>% mutate(ticker = 'GM')
ford <- Quandl("WIKI/F") %>% mutate(ticker = 'F')

dataset <- rbind(tsla, gm)
dataset <- rbind(dataset, ford)
```

In the exampl above, equity data for Tesla, General Motors, and Ford are all pulled separately, then bounded individually. This can become laborious as the number of data requests increase. 

Drawing from tidyverse paradigms, one can nest datasets into a a tibble using the logic below.

Efficient Example:
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
Please refer to the 'edat' rmarkdown file for the full code, which will provide you the methods to expand the nested table into a analysis-ready format.

Benefits:
1. Scalable - the amount of code required to add new variables is significantly reduced.
2. Legibility - easier to see which variables are used, in addition to greater ease when it comes to adding new ones.

Happy coding!
