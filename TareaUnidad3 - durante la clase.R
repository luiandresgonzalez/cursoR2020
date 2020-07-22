# Actualice paquetes (Tools)

# Arme un Excel con info de pacientes, siguiendo los criterios de datos tidy
## Cada variable = 1 columna
## Cada observacion = 1 fila
## Cada tipo de unidad observacional forma una tabla

# Luego, guarde como CSV e importe la tabla a R Studio.
## Import Dataset -> FromText (readr)

library (readr)
Pacientes <- read.csv(file.choose())

# Habia hecho bien la tabla, pero Excel me la guardo con los valores
# separados por puntoycoma en lugar de comas... Con lo cual, se importo
# mal (6 observaciones - 1 variable) y termine editandola manualmente
# en block de notas. Ahi volvi a importar y me quedo un dataframe 'Pacientes'
# de 6 observaciones y 3 variables (nombre, peso y edad).

# Chequee la estructura de 'Pacientes'

str (Pacientes)

# tibble [6 x 3] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
# $ Nombre: chr [1:6] "Dina" "Zafu" "Tom" "Choka" ...
# $ Peso  : num [1:6] 4 6.5 7.6 18 27.3 3.7
# $ Edad  : num [1:6] 11 5 10 16 7 1
# - attr(*, "spec")=
#   .. cols(
#     ..   Nombre = col_character(),
#     ..   Peso = col_double(),
#     ..   Edad = col_double()
#     .. )


# Vamos con BOTI Covid (punto 2 de la tarea)

# Import Dataset -> FromText (readr)

library(readr)
contactos_boti_triage_covid_19 <- read_csv("http://cdn.buenosaires.gob.ar/datosabiertos/datasets/innovacion-transformacion-digital/contactos-boti-triage-covid-19/contactos_boti_triage_covid_19.csv")
# Parsed with column specification:
#   cols(
#     fecha = col_character(),
#     hora = col_double(),
#     triage_cantidad = col_double()
#   )
View(contactos_boti_triage_covid_19)

head(contactos_boti_triage_covid_19, n = 10)

# # A tibble: 6 x 3
# fecha      hora triage_cantidad
# <chr>     <dbl>           <dbl>
#   1 20JUL2020    12               2
# 2 20JUL2020    11              14
# 3 20JUL2020    10              11
# 4 20JUL2020     9               7
# 5 20JUL2020     8               9
# 6 20JUL2020     7               5

# EJECUTAR TIDYVERSSSEEEEE (sino, no funca nada)
library (tidyverse)

# En promedio, cuantos triages se realizaron por cada hora en este periodo? 
# (usar metodo similar al usado en notas.tidy en Clase 3.r)

porhora <- contactos_boti_triage_covid_19 %>%
  group_by(hora) %>%
  summarize(mean=mean(triage_cantidad),
            sd=sd(triage_cantidad),n=n())

view(porhora)

# esto esta mallll
boxplot(porhora$n ~ porhora$hora)


# ahora si
boxplot(contactos_boti_triage_covid_19$triage_cantidad ~ contactos_boti_triage_covid_19$hora, outline = FALSE, ylab = "Llamadas", xlab = "Hora del dia")

?boxplot

boxplot(contactos_boti_triage_covid_19$triage_cantidad ~ contactos_boti_triage_covid_19$fecha)

barplot(porhora$n ~ porhora$hora)

barplot(porhora$mean ~ porhora$hora)

which.max(porhora$mean)

porhora$mean

# porhora[ <fila> , <columna>]

porhora[14 , ]

porhora[which.max(porhora$mean), ]

porhora[which.min(porhora$mean), ]


# https://catalog.data.gov/dataset/fatalities-from-prescription-opioid-overdoses
# https://apps.who.int/gho/data/node.main.A1039?lang=en 
# https://www.gapminder.org/data/ 

