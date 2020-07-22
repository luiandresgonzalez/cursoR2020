# Setup: importando librerias importantes
library(tidyverse)
library(readr)

# Importando CSV
boti.covid <- read_csv("http://cdn.buenosaires.gob.ar/datosabiertos/datasets/innovacion-transformacion-digital/contactos-boti-triage-covid-19/contactos_boti_triage_covid_19.csv")

# Inspeccionando si importó ok
View(boti.covid)

resumen_por_hora <- boti.covid %>%
  select(hora, triage_cantidad) %>%
  group_by(hora) %>%
  summarise(avg = mean(triage_cantidad), sd = sd(triage_cantidad), total = sum(triage_cantidad))

View(resumen_por_hora)

boxplot(boti.covid$triage_cantidad ~ boti.covid$hora, outline = F, xlab = "Hora del dia", ylab = "Consultas")

resumen_por_hora[which.max(resumen_por_hora$total),]
resumen_por_hora[which.min(resumen_por_hora$total),]