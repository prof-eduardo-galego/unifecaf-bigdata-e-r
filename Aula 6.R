df <- read.csv("https://people.sc.fsu.edu/~jburkardt/data/csv/grades.csv")
df

df$Test4

mean(df$Test4) # Média

median(df$Test4) # Mediana

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
getmode(df$Test4) # Moda

min(df$Test4)
max(df$Test4)

sd(df$Test4)

summary(df)
summary(df$Test4)

quantile(df$Test4)
quantile(df$Test4, 0.25) # Primeiro Quartil
quantile(df$Test4, 0.50) # Mediana ou Segundo Quartil
quantile(df$Test4, 0.75) # Terceiro Quartil

quantile(df$Test4, 0.1) # Primeiro Decil
quantile(df$Test4, 0.01) # Primeiro Percentil

# Gráficos
# install.packages("ggplot2")
library(ggplot2)

par(mfrow=(c(1,1)))
hist(df$Test4)

par(mfrow=(c(1,1)))
boxplot(df$Test4)
