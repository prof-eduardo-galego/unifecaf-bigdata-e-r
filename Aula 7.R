library(tidyverse)
library(ggplot2)

# Dados obtidos em http://dados.prefeitura.sp.gov.br/pt_PT/dataset/folha-de-pagamento-prodam
df = read.csv("prodam.csv", sep=";", encoding = "latin1")
df

colnames(df)

# Transformando os dados numéricos em Números:

converterParaNumero <- function(str) {
  str <- str_trim(str)
  str <- str_replace(str, "R\\$", "")
  str <- str_replace(str, "-", "0")
  str <- str_replace(str, "\\.", "")
  str <- str_replace(str, ",", ".")
  return(as.numeric(str))
}

venctoParaNumero <- function(x, output) {
  return(converterParaNumero(x['VENCIMENTOS']))
}

encargoParaNumero <- function(x, output) {
  return(converterParaNumero(x['ENCARGOS']))
}

benefParaNumero <- function(x, output) {
  return(converterParaNumero(x['BENEFÍCIOS']))
}

outrasParaNumero <- function(x, output) {
  return(converterParaNumero(x['OUTRAS.REMUNERAÇÕES']))
}

vencto_num <- apply(df, 1, venctoParaNumero)
encargo_num <- apply(df, 1, encargoParaNumero)
benef_num <- apply(df, 1, benefParaNumero)
outras_num <- apply(df, 1, outrasParaNumero)

df <- cbind(df, 
            'VENCIMENTOS_NUM' = vencto_num, 
            'ENCARGOS_NUM' = encargo_num, 
            'BENEFÍCIOS_NUM' = benef_num,
            'OUTRAS.REMUNERAÇÕES_NUM' = outras_num)

# Calculando o valor da Remuneração:
df['REMUNERAÇÃO_NUM'] <- df['VENCIMENTOS_NUM'] - df['ENCARGOS_NUM'] + df['BENEFÍCIOS_NUM'] + df['OUTRAS.REMUNERAÇÕES_NUM']
df

# Aplicando estatística descritiva
summary(df['REMUNERAÇÃO_NUM'])

# Criando o histograma por salário
par(mfrow=(c(1,1)))
hist(df$REMUNERAÇÃO_NUM)

# Criando o BoxPlot por salário
par(mfrow=(c(1,1)))
boxplot(df$REMUNERAÇÃO_NUM)

# Filtrando alguns cenários
df_clt <- df[(df$VÍNCULO == "CLT: contrato por tempo indeterminado"),]
df_analista <- df[(df$CARGO == "ANALISTA DE TIC"),] 

ggplot(df_analista, aes(x=VÍNCULO, y=REMUNERAÇÃO_NUM)) + 
  geom_boxplot()

# Função para cálculo de outliers
fctOutlier <- function(x) {
  z <- (x - mean(x)) / sd(x)
  return(abs(z) > 3)
}

# Exibindo dados de outliers
df_without_na <- df[rowSums(is.na(df['REMUNERAÇÃO_NUM'])) == 0, ]
outlier <- fctOutlier(df_without_na$REMUNERAÇÃO_NUM)
df_outliers <- df_without_na[outlier, ]
df_outliers

View(df_outliers)
