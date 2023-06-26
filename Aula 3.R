notas <- setRefClass("notas", 
                     fields = list(
                       nomeAluno = "character",
                       nota1 = "numeric", 
                       nota2 = "numeric",
                       nota3 = "numeric"), 
                     methods = list(
                       calcularMedia = function(){
                         media <- (nota1 + nota2 + nota3) / 3
                         return(media)
                       },
                       calcularAprovado = function(corte = 5){
                         if (calcularMedia() >= corte) {
                           print("Aprovado")
                         } else {
                           print("Reprovado")
                         }
                       }
                    ))

notasZezinho = notas(
                  nomeAluno = "Zezinho", 
                  nota1 = 1, 
                  nota2 = 9, 
                  nota3 = 1)

print(notasZezinho$nota1)

print(notasZezinho$calcularMedia())

notasZezinho$calcularAprovado(3)
