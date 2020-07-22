library(tidyverse)

dat <- read.csv(file = "Masterfilerev.csv", header=TRUE)

# view(dat)

mydat <- dat %>%
  select(Name, Period, Scent, Interactduration) %>%
  group_by(Period, Scent) %>%
  summarise(mean = mean(Interactduration), sd = sd(Interactduration))


mydat

ggplot(dat, aes(x = Period)) +
  stat_summary(aes(y = Interactduration, fill = Scent), fun = "mean", geom = "bar", position = "dodge")

ggplot(data = dat) + aes(x = Period, y = Interactduration, fill = Scent) +
  geom_boxplot(outlier.size = -1)  +
  geom_jitter(alpha=0.5,
              position=position_jitterdodge(jitter.width=0.2),
              aes(group= Scent)) +
  labs(y = "Duration of interaction with toy (s)") + 
  theme_minimal()

