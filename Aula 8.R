library(ggplot2)
# install.packages("tibble")
library(tibble)

df = read.csv("dataset_clientes_telecom.csv", sep=",", encoding = "latin1")
df

colnames(df)

ggplot(df, aes(num_minutos_ligacao_mes, porcentagem_tempo_whatsapp)) +
  geom_point(alpha = 0.6) +
  xlab("Soma de minutos em ligação (mês)") +
  ylab("Porcentagem de tempo no Whatsapp")

df[, c("num_minutos_ligacao_mes", "porcentagem_tempo_whatsapp")] = scale(df[, c("num_minutos_ligacao_mes", "porcentagem_tempo_whatsapp")])
df

ggplot(df, aes(num_minutos_ligacao_mes, porcentagem_tempo_whatsapp)) +
  geom_point(alpha = 0.6) +
  xlab("Soma de minutos em ligação (mês)") +
  ylab("Porcentagem de tempo no Whatsapp")

df2 <- df[, c("num_minutos_ligacao_mes", "porcentagem_tempo_whatsapp")]


k <- 3
set.seed(123)
km.out <- kmeans(df2, centers = k, nstart = 20)

df$cluster_id <- factor(km.out$cluster)
ggplot(df, aes(num_minutos_ligacao_mes, porcentagem_tempo_whatsapp, color = cluster_id)) +
  geom_point(alpha = 0.6) +
  xlab("Soma de minutos em ligação (mês)") +
  ylab("Porcentagem de tempo no Whatsapp")
