avg_temp = 39.2
temp_sd = 0.8

d = rnorm(30, mean = avg_temp, sd = temp_sd)

d2 <- round(d,1)
paste(d2, collapse = ', ')

hist(d)

d.enfarenheit <- d * (9/5) + 32

hist(d.enfarenheit)


