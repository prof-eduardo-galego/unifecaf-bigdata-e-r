# df = read.csv("https://people.sc.fsu.edu/~jburkardt/data/csv/oscar_age_female.csv")
df = read.csv("oscar_age_female.csv")
df

View(df)

head(df)
head(df, 10)
tail(df)
tail(df, 10)

nrow(df)
ncol(df)

colnames(df)

colnames(df) <- c("Indice", "Ano", "Idade", "Nome", "Filme")
colnames(df)
