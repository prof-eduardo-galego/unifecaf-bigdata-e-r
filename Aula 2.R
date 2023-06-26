a <- readline("Informe um numero: ")
b <- readline("Informe outro numero: ")

a <- as.integer(a)
b <- as.integer(b)

if (b > a) {
  print("b e maior que a")
} else if (a == b) {
  print("a e b sao iguais")
} else {
  print("a e maior que b")
}

#########################################

c <- readline("Informe mais um numero: ")
c <- as.integer(c)

if (a > b & a > c){
  print("a e o maior")
} else if (b > c) {
  print("b e o maior")
} else {
  print("c e o maior")
}

#########################################

lista_numero = list()
numero_lido <- readline("Informe um numero: ")
while (numero_lido != 's') {
  lista_numero <- append(lista_numero, as.integer(numero_lido))
  numero_lido <- readline("Informe um numero, (pressione 's' para sair): ")
}

maior <- 0
for (numero in lista_numero) {
  if (numero > maior) {
    maior <- numero
  }
}

print(paste("O maior numero e:", maior))


#########################################

calcularMaiorNumero <- function(lista) {
  maior <- 0
  for (numero in lista) {
    if (numero > maior) {
      maior <- numero
    }
  }
  return(maior)
}

nova_lista = list(10,5,3,8,20,50,30,100,4300,54,23)
print(calcularMaiorNumero(nova_lista))
