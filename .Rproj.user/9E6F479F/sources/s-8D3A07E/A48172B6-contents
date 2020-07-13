organico <- c(15, 12, 11, 18, 15, 15, 9, 19, 14, 13, 11, 12, 18, 15, 16, 14, 16, 17, 15, 17, 13, 14, 13, 15, 17, 19, 17, 18, 16, 14)
convencional <- c(11, 16, 14, 18, 6, 8, 9, 14, 12, 12, 10, 15, 12, 9, 13, 16, 17, 12, 8, 7, 15, 5, 14, 13, 13, 12, 11, 13, 11, 7)

b <- min(c(organico,convencional)) - 0.001 # Set the minimum for the breakpoints
e <- max(c(organico,convencional))
ax <- pretty(b:e, n = 12) # Make a neat vector for the breakpoints

c1 <- rgb(173,216,230,max = 255, alpha = 80, names = "lt.blue")
c2 <- rgb(255,192,203, max = 255, alpha = 80, names = "lt.pink")

plot(hgA, col = c1, main = "Orgánico y convencional")

plot(hgB, col = c2, add = TRUE)

# Juntar los dos en un dataframe

combineta <- data.frame(organico, convencional)
str(combineta)
View(combineta)
ftable(combineta)

# esto está maaaaaal! Porque no sigue los estandares de una tabla prolija

tipos <- c(rep("organico", 30),rep("convencional", 30))
tipos

fusion <- c(organico, convencional)
fusion

combinetaPiola <- data.frame(tipo = tipos, condicion = fusion)
View(combinetaPiola)
str(combinetaPiola) # tipo todavía no es factor

combinetaPiola$tipo <- as.factor(combinetaPiola$tipo)

plot(combinetaPiola)


# usando ggplot

library(ggplot2)

graficopeola <- ggplot(combinetaPiola, aes(condicion, fill = tipo))
graficopeola + stat_count(position = position_dodge(width = 1))

graficopeola + geom_bar(position = position_dodge2(preserve = "single"))

graficopeola + geom_histogram(position = "dodge")
