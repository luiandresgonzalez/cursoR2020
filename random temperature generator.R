avg_temp = 37.2
temp_sd = 0.4

d = rnorm(1500, mean = avg_temp, sd = temp_sd)

round(d,1)

hist(d)

d.enfarenheit <- d * (9/5) + 32

hist(d.enfarenheit)
