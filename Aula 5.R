df = read.csv("oscar_age_female.csv")
head(df)

df$Name
df['Name']

colnames(df)

# Criação de atributo
df$IsOlderThan90 <- (df$Year < 1990)
df

# Remoção de atributos
df2 <- df[c('Name', 'Movie')]
df2

# Filtro
df[(df$Year < 1990),]

# Ordenação
df[order(df$Year, decreasing=TRUE),]

# install.packages("dplyr")
library(dplyr)

# Filtro utilizando biblioteca dplyr
filter(df, Year < 1990)
filter(df, IsOlderThan90 == TRUE)

# install.packages("tidyverse")
library(tidyverse)

filter(df, str_trim(Name) == "Meryl Streep")

# Ordenação utilizando biblioteca dplyr 
df %>% arrange(desc(Year))


# Criação de Data Frame
df_new = data.frame(col1 = c("b","b","d","e","e") , 
                        col2 = c(0,2,1,4,5), 
                        col3= c(TRUE,FALSE,FALSE,TRUE, TRUE))
df_new
