library(readr)
notas <- read_csv("Book1.csv")

View(notas)

head(notas)

mean(notas$final1)


# Each variable forms a column.
# 
# Each observation forms a row.
# 
# Each type of observational unit forms a table.

library(tidyverse)

notas.tidy <- notas %>% 
  pivot_longer(final1:final3, names_to = "final", values_to = "notas") %>% 
  arrange(nombre, notas)

View(notas.tidy)

notas.tidy %>%
  group_by(final) %>%
  summarize(mean = mean(notas), sd = sd(notas), n = n()) #ignorar warnings

notas.tidy %>%
  group_by(nombre) %>%
  summarize(mean = mean(notas), sd = sd(notas), n = n()) #ignorar warnings

iris %>%
  group_by(Species) %>%
  summarise(avg = mean(Sepal.Width)) %>%
  arrange(avg)

iris %>%
  filter(Sepal.Length > 7)

str(notas)

notas$nombre <- as.factor(notas$nombre)
