
################################
##### 4 - estat�stica descritiva
################################

###  FATORES

# Vari�veis num�ricas X vari�veis categ�ricas

# vari�vel num�rica = vari�vel que representa algum valor num�rico. Por ex, 
# altura ou peso de uma pessoa; pre�o de uma casa.

# vari�vel categ�rica = vari�vel que indica uma categoria, uma segmenta��o.
# Por ex, faixas et�rias; 
var_categorica = c('Sol', 'Chuva', 'Chuva', 'Sol', 'Sol')

#obs: podemos representar uma vari�vel categ�rica usando n�meros:
var_categorica_com_numeros = c(1,0,0,1,1)
#neste caso, Sol = 1 e Chuva = 0.

#para que o R compreenda que uma vari�vel instanciada com num�ros seja tratada
#como vari�vel num�rica, devemos usar a fun��o "factor" para convers�o. Veja:

class(var_categorica)
class(var_categorica_com_numeros)

?factor
fator = factor(var_categorica_com_numeros)
class(fator)
fator

# A estat�stica descritiva ocupa-se da sintetiza��o dos dados de forma direta. 

#Medidas de posi��o: S�o as estat�sticas que fornecem medidas 
# para caracterizar o comportamento dos elementos de um conjunto de dados.
mean(c(1,2,3,4,500))
# valores m�nimos e m�ximos: amplitude
a = sample(c(1:30), size = 10)
a
min(a)
max(a)
amplitude = max(a) - min(a)
amplitude


# M�dia : A m�dia aritm�tica � igual ao quociente entre a soma dos valores do 
# conjunto e o n�mero total dos valores.
a = sample(c(1:30), size = 10)
a
mean(a)

plot(c(1:10),a, xlim=c(1.0,11.0), ylim=c(1.0, 200.0), xlab='indice', ylab='dados')
lines(c(1:10), rep(mean(a),10))

a
a_ = append(a, c(200))
a_
mean(a_)

par(new=T)
plot(c(1:11),a_, xlim=c(1.0,11.0), ylim=c(1.0, 200.0), xlab='', ylab='', axes=F)
lines(c(1:11), rep(mean(a_),11))


# Mediana: � o elemento que ocupa a posi��o central do conjunto.
b = c(1:5)
b
median(b)

#a mediana n�o � afetada por valores discrepantes!
b = c(b, 200)
b
median(b)

b = c(b, 1000)
b
median(b)


mean(a_)
median(a_)

plot(c(1:10),a, xlim=c(1.0,11.0), ylim=c(1.0, 200.0), xlab='indice', ylab='dados')
lines(c(1:10), rep(mean(a),10))
par(new=T)
plot(c(1:11),a_, xlim=c(1.0,11.0), ylim=c(1.0, 200.0), xlab='', ylab='', axes = F)
lines(c(1:11), rep(median(a_),11))


# Quartis: s�o os valores de um conjunto que o dividem em quatro partes iguais. 
a = sample(c(1:30), size = 20)
a
sort(a)
quantile(a)
quantile(a, c(0,0.1,0.25,0.5,0.7,0.75,0.8,0.9,1))

a1 = append(a, c(111, 145, 300))
a1
quantile(a1, c(0,0.1,0.25,0.5,0.75,0.8,0.85,0.9,1))
median(a1)

a2 = append(a1,-100)
quantile(a2, c(0,0.05,0.1,0.25,0.5,0.75,0.8,0.85,0.9,1))

#podemos coletar apenas a parte de a2 que nos interessa!
a2
median(a2)
sd(a2)

a3 = a2[a2<median(a2)+sd(a2)]
a3
mean(a3)

a3 = a2[a2>1 & a2<=10]
a3
mean(a3)

# Medidas de dispers�o : apresentam a caracter�stica de avaliar a dispers�o 
# dos dados em torno dos valores centrais. 
?rnorm
n_samples = 10
x1 = rnorm(n_samples, 10, 1)
x2 = rnorm(n_samples, 10, 4)

x1
x2

mean(x1)
mean(x2)
median(x1)
median(x2)

plot(c(1:n_samples), x1, type = 'o', col= 'blue', ylim = c(0,20))
lines(c(1:n_samples), x2, type = 'o', col = 'red')

quantile(x1, c(0,0.1,0.25,0.5,0.75,0.9,1))
quantile(x2, c(0,0.1,0.25,0.5,0.75,0.9,1))

# vari�ncia e o desvio padr�o
# desvio padrao = raiz quadrada da vari�ncia.
# devemos analisar o desvio padr�o, pois este segue a mesma unidade de media
# que os dados! por exemplo, se um vetor representa altura em metros, a variancia
# representar� uma varia��o dada em metros quadrados! assim, tiramos a raiz quadrada
# para termos essa varia��o na mesma unidade de medida!!

var(x1)
sd(x1)

var(x2)
sd(x2)

##################
##### 5 - gr�ficos
##################

#gr�ficos relacionados � vari�veis categ�ricas:
# gr�ficos de barra (e gr�ficos de pizza)
table(mtcars$cyl)
barplot(table(mtcars$cyl))
?barplot
barplot(table(mtcars$cyl), col = 'black')

#gr�ficos para vari�veis num�ricas:
# scatter plot (gr�ficos de dispers�o) e histogramas

#scatter plot
mtcars
?mtcars
?plot
plot(mtcars$mpg, mtcars$wt)
plot(mtcars$mpg, mtcars$wt, pch = 20)
plot(mtcars$mpg, mtcars$wt, pch = 8, col = 'blue')


plot(c(1:length(mtcars$mpg)), mtcars$mpg, pch =20)
plot(c(1:length(mtcars$mpg)), mtcars$mpg, type='l')
#histograma : � um gr�fico de barras verticais que apresenta a
# distribui��o de frequencia de uma vari�vel num�rica.

mtcars$mpg
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 2)

normal1 = rnorm(1000, mean = 10, sd = 1)
normal2 = rnorm(1000, mean = 10, sd = 5)
par(mfrow=c(1,2)) #c(1,2) indica quebra da �rea gr�fica em 1 linha e 2 colunas
hist(normal1)
hist(normal2)

par(mfrow=c(1,2))
hist(normal1,xlim = c(-10,30))
hist(normal2, xlim = c(-10,30))


#boxplot : gr�fico de caixas. �  o gr�fico que "traduz" os quartis
quantile(mtcars$mpg)
boxplot(mtcars$mpg)


boxplot(c(10,12,8,11,9,13,7)) #totalmente sim�trico
quantile(c(10,9,9,9,13,13,13,8,8,15,15))
boxplot(c(10,9,9,9,13,13,13,8,8,15,15)) #perceba a assimetria!

vetor = sample(c(1:20), size = 50, replace = T)
boxplot(vetor)
quantile(vetor)
vetor

vetor1 = append(vetor, c(40,50,-10,-11,-12))
quantile(vetor1)
vetor1
boxplot(vetor1)


###############################################
##### 6 - pacote dplyr: transforma��o nos dados
###############################################

#install.packages('dplyr')
library(dplyr)

?mtcars
mtcars
my_mtcars = mtcars
my_mtcars$nome_carro = rownames(mtcars)
my_mtcars
rownames(my_mtcars) = NULL
my_mtcars

#resumo estat�stico de cada coluna
summary(my_mtcars)

#fun��es b�sicas do dplyr: filter, select, group_by, summarise, mutate

#filtre linhas com filter()
my_mtcars %>% filter(cyl==6)
my_mtcars %>% filter(cyl==6 & am==1)
my_mtcars %>% filter(drat > wt)

#ordene linhas com arrange()
my_mtcars %>% arrange(desc(mpg))

#selecione colunas com select
my_mtcars %>% select(disp, carb)
my_mtcars %>% filter(cyl==6 & am==1) %>% select(disp, carb, mpg) 

#adicione novas colunas com mutate()
my_mtcars %>% mutate(peso_potencia = wt * 1000 / hp)
my_mtcars %>% mutate(peso_potencia = wt * 1000 / hp) %>% arrange(desc(peso_potencia))

my_mtcars$peso_potencia = my_mtcars$wt * 1000 / my_mtcars$hp
my_mtcars

#se voc� quiser ficar apenas com as colunas transformadas:
my_mtcars %>% transmute(
          peso_potencia = wt * 1000 / hp,
          consumo_potencia = mpg / hp
) %>% arrange(desc(peso_potencia), desc(consumo_potencia))

#selecione amostras aleatoriamente com sample_n() e sample_frac()
my_mtcars %>% sample_n(10)
my_mtcars %>% sample_frac(0.1)

#group_by � usada em conjunto com a summarise
# suponha que queremos agrupar os dados para cada cyl e ver a media de mpg
my_mtcars %>% group_by(cyl) %>% summarise(media = mean(mpg))
my_mtcars %>% group_by(cyl) %>% summarise(mean(mpg))
my_mtcars %>% group_by(cyl) %>% summarise(media = mean(mpg))

my_mtcars %>% group_by(cyl, am) %>% summarise(Max_mpg = max(mpg), 
                                                      Media_drat = mean(drat))


install.packages('nycflights13')
library(nycflights13)
dim(flights)
flights