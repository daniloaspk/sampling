#Primeiro Carregamos os Pacotes
library(xlsx)


#Primeiro indico onde os arquivos se encontram
setwd("C:/Users/Usu�rio/Desktop")

#Agora eu abro o arquivo como tabela
dados<-read.xlsx("inv.xlsx", sheetName = "Planilha1")

#Abro o arquivo de dados
head(dados)
str(dados)

#Na sequencia cria-se os parametros para o la�o for in
#"n" ser� o n�mero de amostragens
n = 10000

#"resultado" ser� um objeto do tipo lista que representar� como cada amostragem deve ser apresentada
resultado=list(c(NA))

#Ser� criado um la�o de 1 at� n (1000) onde o conte�do i de "resultado" ser�o amostras de tamanho 20 com reposi��o das parcelas
#O  duplo colchete serve para indica que cada resultado deve conter todo o conte�do de tamanho 20

for(i in 1:n)
{
  resultado[[i]]<-sample(dados$v1, size=20, replace=TRUE)
}


dados <- c("cara","coroa")

for(i in 1:100)
{
  resultado[[i]]<-sample(dados, size=10, replace=TRUE)
}

#Abrir o conte�do das amostragens
resultado

#Criaremos agora uma lista que servir� de cabe�alho para resultado
names(resultado)<-paste('A', 1:100, sep = '')

#Vericamos agora se resultaddo � uma lista
is.list(resultado)

#transformamos em um data.frame
amostras<-as.data.frame(resultado)
amostras


# e salvamos a amostragem em um arquivo .txt
write.xlsx(amostras, file = "tabela.xlsx")