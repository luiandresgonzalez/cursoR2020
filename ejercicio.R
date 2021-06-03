library(tidyverse)

load(url("https://github.com/rstudio/EDAWR/raw/master/data/cases.rdata"))
load(url("https://github.com/rstudio/EDAWR/raw/master/data/storms.rdata"))
load(url("https://github.com/rstudio/EDAWR/raw/master/data/tb.rdata"))
load(url("https://github.com/rstudio/EDAWR/raw/master/data/pollution.rdata"))

pollution

spread(pollution,size, amount)
st <- separate(storms, date, c("año", "mes", "dia"), sep = "-")
unite(st, date,  c("dia","mes","año"), sep = "/")

storms %>% 
  select(storm, wind) %>% 
  filter(wind >= 50) %>% 
  arrange(desc(wind))

pollution %>% 
  group_by(city) %>% 
  summarise(mean = mean(amount))
          
tb %>% 
  filter(year == 2013) %>% 
  mutate(cases = child + adult + elderly) %>% 
  group_by(country) %>% 
  summarise(Cases = sum(cases)) %>%
  arrange(desc(Cases)) %>% 
  View()


