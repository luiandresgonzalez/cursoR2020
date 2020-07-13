# Generar una secuencia de 29 numeros (entre 1 y 100) que vayan de 3.5 en 3.5.
seq (from = 1, to = 100, by = 3.5)

# Almacenar en un vector "secuencia" los 29 numeros generados.
secuencia <- c(seq(from=1, to=100, by=3.5))

# Sumar el valor en posicion 23 con el 12vo
secuencia [23] + secuencia [12]

# Desde aqui, arranca la tarea con el peso de los pollitos... 
# Lo dejo a tu criterio.
library (tidyverse)

datos <- ChickWeight %>%
  filter( Time == 2) %>% 
  as.data.frame()

# Asigne a un vector "pesos" unicamente los datos correspondientes a "weight"
# para verlos mejor:
pesos <- datos ["weight"]

# El paso anterior fue un fiasco, porque no me permitio hacer ni la
# Estadistica descriptiva, asi que probe haciendo un nuevo vector
# en un intento de extraer los valores.

# CORRECCION ===========
# Este es un error importante, y algo que tiende a ocurrir cuando se trabajan
# con tipos de datos que las funciones no aceptan. El matete que puede hacerse con 
# diferentes estructuras de datos es algo que corresponde a un nivel avanzado de R. 
# se puede razonar un poco igua. Vamos a verlo: Si pones

mean(pesos)

# Te dice que el argumento no es numerico o logico. 
# Donde esta el problema?

help(mean)

# Si ves en la seccion argumentos, te dice que "x", (el unico parametro
# que le metes) pide que sea un VECTOR numerico o logico

typeof(pesos)

# Te retorna que pesos se trata de una lista. Por que paso esto, pero esta relacionado con que 
# muchas veces cuando creas un objeto a partir de otro, este hereda sus propiedades 
# (fijate que tipo es datos y vas a tener la respuesta).

# Cuando le metes corchetes a algo que no es un vector, la cosa tiende a complicarse
# Porque uno simplemente no puede usar UN solo numero (como hace con los vectores, que tienen una dimension).  
# para algo que es una tabla que tiene mas de una dimension (como no podrias definir celdas en una tabla de excel). 
# De hecho:

dim(pesos) #<- comando para ver las dimensiones de un objeto

# Te muestra que el objeto pesos tiene 2 dimensiones, una de tamanio 50 (las filas)
# y la otra tamanio 1 (una columna). Si ponemos:

pesos[3,1] #<- retornar el indice de fila 3 y columna 1

# Si no ponemos nada adentro de los corchetes?
pesos[  ]

# Te retorna todo tal cual. Si solo especificamos columna (el valor despues
# de la coma) y no ponemos nada en las filas:
pesos[ , 1]

class(pesos[,1])

# Alternativamente, podes llamar a la columna por su nombre

pesos[ , "weight"] # todas las filas, columna weight

# =======================

pruebapesos <- c(datos["weight"])

# Eso si me mostro una secuencia de datos concatenados, peeeero no podia correr 
# las pruebas porque no consideraba los valores como numericos.
# No digan que no se estan divirtiendo...

# CORRECCION ===========
# No funciona por el mismo motivo que antes (herencia de tipos). 
# El producto de ese comando da como resultado una lista, y no un vector. 
# =======================

# Curiosamente, al mostrar la secuencia, agregaba el signo pesos antes de "weight"
# $weight
# [1] 51 49 39 49 42 49 49 50 51 44 51 49 48 49 49 45 51 35 48 47 50 55 52 52 49 48 46
# [28] 46 48 48 53 49 50 49 53 48 48 49 50 55 51 49 55 51 50 52 53 50 53 54

# Ergo, intuyo que eso permite operar con una linea de variables 
# dentro del paquete de datos, asi:

# CORRECCION ===========
# Tu intuicion es la correcta, y el signo pesos simplemente extrae una 
# columna que vos selecciones de un objeto tipo lista o data.frame. 
# No se recomienda poner un espacio entre objeto y nombre de columna.

datos$weight # esto da el mismo resultado. 

# =======================

# Media de pesos
mean (datos $weight) 

# Mediana
median (datos $weight)

# Desvio
sd (datos $weight)

# Varianza
sd (datos $weight)^2

# =======================
var(datos$weight) # Descubri que el comando para varianza es este!
# =======================

# Histograma
hist (datos $weight)

# Tabla de frecuencias
table (datos $weight)

# Siguiendo con el ejercicio, ejecutar un boxplot
boxplot(datos$weight~datos$Diet)

## Entiendo que muestra la media y desvio para el peso de los pollos 
## "datos$weight" en funcion "~" del tipo de dieta "datos$Diet"

# CORRECCION ===========
# Es EXACTAMENTE ESO! el simbolo ~ se lee como "en función de"! No 
# te das una idea de lo que me costo entender eso al principio. 
# El boxplot resume la distribucion de los datos
# https://towardsdatascience.com/understanding-boxplots-5e2df7bcbd51
# =======================

# Despues hice varios intentos de analizar los datos con cada dieta pero
# no encontre como convocar los datos de determinadas filas... continuara.

# CORRECCION ===========
# El tidyverse nos va a ayudar a revoltijear los datos para que hagan
# lo que vos quieras. Por ejemplo, le decimos "agarrame datos, agrupalos
# por dieta, resumimelos con media desvio y " te queda:
datos %>%
  group_by(Diet) %>%
  summarize(mean = mean(weight), sd = sd(weight), n = n()) #ignorar warnings
# =======================


