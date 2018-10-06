
#########################    An?lise de dados em R

getwd()
#########################
##### 1- comandos b?sicos
#########################


2+3

4+1
2*3
10/2
sqrt(100)
log(10)

# operadores de atribui??o
a = 10
a
b<-10.4
b
class(a)
class(b)

a1 = as.integer(a)
class(a1)

# strings

s = 'curso de R'
s
class(s)

#booleanos 

10>2
is.numeric(s)

# operadores de compara??o

10==4
10<=4
f = 10>4
f
!(10<=4)
!FALSE

# condi??es E / OU

#? verdade que 10 ? maior que 5 E 10 ? maior que 12? n?o!
# ? verdade que 10 ? maior que 5 OU 10 ? maior que 12? sim!

10>5 & 10>12  # & representa a condi??o E
10>5 | 10>12  # | representa a condi??o OU


# instala??o de pacotes
# install.packages(" nome do pacote ")
# library(nome do pacote)
install.packages()
#exemplo: vamos instalar o pacote dplyr, muito usado para manipula??o de dados
#MAKE='make -j 8'
install.packages("dplyr")
library(dplyr)

#pedindo ajuda! fun??o help

help("sqrt")
?sqrt



#################################
##### 2 - estruturas b?sicas do R
#################################
?c

vec = c()
vec
vec = append(vec,33)
vec
vec = append(vec,55)
vec
###  VETORES

vec1 = c(10, 20, 15, 40)  # vetor num?rico
vec1
vec2 <- c("a", "b", "c")  # vetor de strings
vec2
vec3 <- c(TRUE, FALSE, TRUE, TRUE)  # vetor de booleanos
vec3

length(vec1)
length(vec2)
sum(vec1)
max(vec1)
min(vec1)

# slicing em vetores : fatiamento.
vec1
vec1[1]
vec1[c(1)]
vec2[3]
vec1[c(1,4)]
vec1[2:3]

condicao_logica = vec1 < 20
condicao_logica
vec1[condicao_logica]

# gerando um vetor aleat?rio : fun??o sample
?sample
vetor = sample(c(1:20), size = 5, replace = FALSE)
vetor

vetor = sample(c(1:20), size = 5, replace = FALSE, prob = c(0.9, rep(0.1/19, 19)))
vetor

vetor = sample(c(1:20), size = 5, replace = FALSE, prob = c(0.9, rep(0.05/15, 15), rep(0.05/4, 4)))
vetor

?sort
vetor_ord_crescente = sort(vetor)
vetor_ord_crescente

vetor_ord_decrescente = sort(vetor, decreasing = TRUE)
vetor_ord_decrescente

# missing values : valores n?o preenchidos

vec <- c("a", "b", "c", NA, "e")
vec

is.na(vec)
!is.na(vec)
vec[!is.na(vec)]

###  LISTAS
?list
lista_vazia = list()
lista_vazia

lista = list(vec1,vec2,vec3)
lista
c(TRUE,'afonso')
list(TRUE,'afonso')
###  DATAFRAMES = datasets = tabelas

vec1 <- c(10, NA, 15, 40, 12)  # vetor num?rico
vec2 <- c("a", "b", "c", "d", "e")  # vetor de strings
vec3 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)  # vetor de booleanos

?data.frame
df = data.frame(vec1,vec2,vec3)
df
?data.frame
data.frame(idades=c(12,45),nomes = c('joao','maria'))

#exemplos de datasets j? dispon?veis no R
library(datasets)
?datasets
library(help = 'datasets')
class(airquality)
airquality
head(airquality)
head(mtcars)
mtcars
?mtcars

class(data.frame(mtcars))
iris
head(iris)
head(mtcars)
head(mtcars, 10)
tail(mtcars)

colnames(mtcars)
dim(mtcars)[1]
ncol(mtcars)
nrow(mtcars)

#como acessar uma coluna?
mtcars$mpg
mtcars$wt
#slicing de dataframes
mtcars
# sintaxe : dataframe[linhas, colunas]
mtcars[1,] #linha 1 e todas as colunas
mtcars[c(1,2,5), ] # linhas 1,2 e 5, todas as colunas
mtcars[,1:3] # todas as linhas, colunas 1, 2 e 3
mtcars[1:5,c(1,7)] #linhas 1 at? 5, colunas 1 e 7

mtcars[mtcars$mpg<20,] #linhas onde mpg < 20, todas as colunas
mtcars[mtcars$mpg<20 & mtcars$hp>200,]

#como 'colar' dataframes?
df1 = mtcars[1:5, c(1:5)]
df2 = mtcars[10:20, c(1:5)]
df3 = mtcars[1:5, c(6:9)]

df1
df2
df3

rbind(df1,df2)
dfnovo = cbind(df1,df3)
dfnovo
#tabelas de conting?ncia
?mtcars
head(mtcars)
mtcars$cyl
?table
table(mtcars$cyl)
?prop.table
prop.table(table(mtcars$cyl))


table(mtcars[,c('cyl','am')])
table(mtcars[,c('cyl','am', 'gear')])


#################################
##### 3 - estruturas de controle
#################################

# condicional IF-ELSE

#gerando um n?mero aleat?rio entre 1 e 10:
a = sample(c(1:10), size = 1)
a
?sample
#caso o n?mero seja maior do que 5, vamos multiplic?-lo por 2, 
# caso contr?rio, vamos mudar seu sinal

if (a>5){
  a = a*2
}else{
  a = (-1)*a
}
a

# loop FOR 

vec = mtcars$mpg
vec

for (i in c(1:10)){
  print(vec[i])
}

# FUN??ES 
#? uma rotina que realiza tarefas espec?ficas.
# sintaxe: nome_da_funcao = function(parametros){ execute a rotina }

#fun??o que eleva um numero ao quadrado
eleva_quadrado = function(x){
  return(x^2)
}
eleva_quadrado(c(1,2))
eleva_quadrado(10)
#fun??o que retorna o segundo maior valor de um vetor

segundo_maior_valor = function(vetor){
  s = sort(vetor, decreasing = TRUE) # do maior para o menor
  return(s[2])  
}

vetor = sample(c(1:100), size = 10)
vetor
segundo_maior_valor(vetor)
sort(vetor, decreasing = TRUE)

#em an?lise de dados, fun??es s?o muito usadas para manipula??o e 
#transforma??o de colunas em datasets

df = mtcars[c(1:5), c(1:3)]
df
#quero criar uma nova coluna = mpg^2

df$nova_coluna = 0
df
for (i in c(1:nrow(df))){
  df[i,c(4)] = df[i, c(1)]^2 
}
df

#existe uma solu??o mais simples e muito melhor!! usar a fun??o sapply
?sapply
  
df$nova_coluna_2 = sapply(df$mpg, eleva_quadrado)
df

df$nova_coluna_3 = sapply(df$disp, function(x){sqrt(x)} )
df
