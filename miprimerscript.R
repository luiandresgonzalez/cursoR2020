# asignar el valor 37.5 a temperatura 

temperatura <- 37.5

# jasjdfajjfajs d
(temperatura * 9/5) + 32

# 

temperaturas <- rnorm(n = 30, mean = 37.6, sd = 1.5)

# para ver el contenido, solo escribo el nombre del objeto
temperaturas

# si quiero ver un numero de indice determinado, solo pongo corchetes y el numero de indice
temperaturas[15]

mean(temperaturas)
median(temperaturas)

desvio <- sd(temperaturas)

miVarianza <- desvio^2

hist(temperaturas)

temp2 <- rnorm(n = 30, mean = 38.5, sd = 1.5)

t.test(temperaturas,temp2)


(temperaturas * 9/5) + 32




