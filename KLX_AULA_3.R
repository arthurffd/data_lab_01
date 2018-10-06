

############################################
##### 7 - exemplo básico de análise de dados
############################################

# questão de negócio: ......

df1 = read.csv('SENAI_ANO1.csv')
df2 = read.csv('SENAI_ANO2.csv')
df3 = read.csv('SENAI_ANO3.csv')
df4 = read.csv('SENAI_ANO4.csv')

#df1novo = read.csv('SENAI_ANO1_parte2.csv')
#df2novo = read.csv('SENAI_ANO2_parte2.csv')
#df3novo = read.csv('SENAI_ANO3_parte2.csv')
#df4novo = read.csv('SENAI_ANO4_parte2.csv')
head(df1)
dim(df1)
#head(df1novo)
#table(df1novo$V3)
#head(df1)
# 0 significa escola publica, 1 escola privada

#eliminar essa coluna X
df1$X = NULL
df2$X = NULL
df3$X = NULL
df4$X = NULL
head(df1)

# agrupar os datasets em um só
df = rbind(df1, rbind(df2, rbind(df3,df4)))
head(df)
dim(df)
colnames(df) = c('nota1', 'nota2')
head(df)
dim(df)
View(df)

# adiciionar o ano de cada aluno
s1 = rep(1,150)
s1
s2 = rep(2,150)
s2
append(s1,s2)
s3 = rep(3,150)
s4 = rep(4,150)

df$Ano = append(s1,append(s2,append(s3,s4)))
View(df)

head(df)
tail(df)
table(df$Ano)

#criar uma nova coluna, com a média de cada aluno

df$media_notas = 0
head(df)
table(df$media_notas)
table(df$Ano)


df[1,c(1,2)]
class(df[1,c(1,2)])

as.numeric(df[1,c(1,2)])
class(as.numeric(df[1,c(1,2)]))

for (i in c(1:nrow(df))){
  df[i,4] = mean(as.numeric(df[i,c(1,2)]))
}

head(df)
tail(df)
View(df)
library(dplyr)

df_medias  = df %>% group_by(Ano) %>% summarise(media = mean(media_notas))
df_medias = data.frame(df_medias)
df_medias

View(df_medias)

#observamos que a media diminui!! isso poderia implicar que o 
# professor não está dando boas aulas! rendimento dos alunos está decaindo!

plot(df_medias$Ano, df_medias$media, type = 'b', pch = 20, 
     xlab = 'Ano', ylab = 'nota média', 
     main = 'Rendimento dos alunos está dimiuindo!!')

plot(factor(df_medias$Ano), df_medias$media, type = 'b', pch = 20, 
     xlab = 'Ano', ylab = 'nota média', 
     main = 'Rendimento dos alunos está dimiuindo!!')

# será que devemos acreditar que a média é um bom indicador de que
# os professores estão cada vez piores?!
# vamos analisar um pouco mais...


par(mfrow=c(1,3))
hist(df$nota1, main = 'notas 1', col = 'gray25')
hist(df$nota2, main =  'notas 2', col = 'gray29')
hist(df$media_notas, main = 'média', col = 'gray33')

par(mfrow=c(1,2))
hist(df1$x1)
boxplot(df1$x1)

boxplot(df1)
boxplot(df4)

par(mfrow=c(1,1))
plot(df$nota1, df$nota2, pch = 20, xlab = 'Nota1', ylab = 'Nota2', 
     main = 'Resumo do comportamento das notas em todos os anos')

par(mfrow=c(2,2))
lista = list(df1,df2,df3,df4)
for (i in c(1:4)){
  plot(lista[[i]]$x1, lista[[i]]$x1.1, pch = 20, main = paste('Ano ', as.character(i)),
       xlab = 'nota 1', ylab = 'nota 2')
}

#neste ponto, voce mostra essas informações para o gestor da questão
# e pede por dados demográficos... 

#e recebe a seguinte notícia: todos os alunos possum um "marcador" dizendo
# se o aluno era de escola pública ou privada

#novos dados com essas informações:

df1novo = read.csv('SENAI_ANO1_parte2.csv')
df2novo = read.csv('SENAI_ANO2_parte2.csv')
df3novo = read.csv('SENAI_ANO3_parte2.csv')
df4novo = read.csv('SENAI_ANO4_parte2.csv')

head(df1novo)
table(df1novo$V3)

df1novo$X = NULL
df2novo$X = NULL
df3novo$X = NULL
df4novo$X = NULL

dfnovo = rbind(df1novo, rbind(df2novo, rbind(df3novo,df4novo)))
head(dfnovo)
dim(dfnovo)
colnames(dfnovo) = c('nota1', 'nota2', 'tipo_ensino')
head(dfnovo)

# 0 = escola pública; 1 = escola privada
table(dfnovo$tipo_ensino)

#colocando os anos de cada aluno
s1 = rep(1,150)
s2 = rep(2,150)
s3 = rep(3,150)
s4 = rep(4,150)

dfnovo$Ano = append(s1,append(s2,append(s3,s4)))

head(dfnovo)
tail(dfnovo)

View(dfnovo)

#calculando as médias 
dfnovo$media_notas = 0

for (i in c(1:nrow(df))){
  dfnovo[i,5] = mean(as.numeric(dfnovo[i,c(1,2)]))
}

head(dfnovo)
tail(dfnovo)

View(dfnovo)


head(df)
tail(df)


par(mfrow=c(2,2))
lista = list(df1novo,df2novo,df3novo,df4novo)
for (i in c(1:4)){
  plot(lista[[i]]$x1, lista[[i]]$x1.1, pch = 20, main = paste('Ano ', as.character(i)),
       xlab = 'nota 1', ylab = 'nota 2', col = factor(lista[[i]]$V3), lwd=2)
}

head(dfnovo)

df_medias2 = dfnovo %>% group_by(Ano, tipo_ensino) %>% summarise(media = mean(media_notas))
df_medias2 = data.frame(df_medias2)
df_medias2

privada = df_medias2 %>% filter(tipo_ensino==0)
publica = df_medias2 %>% filter(tipo_ensino==1)

privada
publica

View(privada)
View(publica)

par(mfrow=c(1,1))
plot(publica$Ano, publica$media, xlab = 'Ano', ylab='Média', type = 'o', pch = 18, col= 'black', 
     ylim = c(55,90), lwd = 2)
lines(privada$Ano, privada$media, type = 'o', pch = 20, col = 'red', lwd = 2)

##########
# Outliers
##########

#privada == 0 
#publica == 1

head(dfnovo)

#tipo_ensino 0/1 . ano 1..4
t0.1 = dfnovo %>% filter(tipo_ensino==0, Ano==1)
t1.1 = dfnovo %>% filter(tipo_ensino==1, Ano==1)

t0.2 = dfnovo %>% filter(tipo_ensino==0, Ano==2)
t1.2 = dfnovo %>% filter(tipo_ensino==1, Ano==2)

t0.3 = dfnovo %>% filter(tipo_ensino==0, Ano==3)
t1.3 = dfnovo %>% filter(tipo_ensino==1, Ano==3)

t0.4 = dfnovo %>% filter(tipo_ensino==0, Ano==4)
t1.4 = dfnovo %>% filter(tipo_ensino==1, Ano==4)


head(t0.1,10)
tail(t0.1, 10)

par(mfrow=c(2,2))
plot(t0.1$nota1, t0.1$nota2, pch = 20, xlab = 'Nota 1',ylab = 'Nota 2',
     main = 'Ensino privado, ano 1')
plot(t0.2$nota1, t0.2$nota2, pch = 20, xlab = 'Nota 1',ylab = 'Nota 2',
     main = 'Ensino privado, ano 2')
plot(t0.3$nota1, t0.3$nota2, pch = 20, xlab = 'Nota 1',ylab = 'Nota 2',
     main = 'Ensino privado, ano 3')
plot(t0.4$nota1, t0.4$nota2, pch = 20, xlab = 'Nota 1',ylab = 'Nota 2',
     main = 'Ensino privado, ano 4')


head(t1.1,10)
tail(t1.1, 10)

par(mfrow=c(1,1))
plot(t1.1$nota1, t1.1$nota2, pch = 20)

mean(t0.1$media_notas)
sd(t0.1$media_notas)

# estamos retirando os pontos que sejam considerados 'outliers'
t0.1_ = t0.1 %>% filter(media_notas > (mean(t0.1$media_notas)-sd(t0.1$media_notas)))

#perceba a diferença!
summary(t0.1$media_notas)
summary(t0.1_$media_notas)

t1.1_ = t1.1 %>% filter(media_notas > (mean(t1.1$media_notas)-sd(t1.1$media_notas)))

t0.2_ = t0.2 %>% filter(media_notas > (mean(t0.2$media_notas)-sd(t0.2$media_notas)))
t1.2_ = t1.2 %>% filter(media_notas > (mean(t1.2$media_notas)-sd(t1.2$media_notas)))

t0.3_ = t0.3 %>% filter(media_notas > (mean(t0.3$media_notas)-sd(t0.3$media_notas)))
t1.3_ = t1.3 %>% filter(media_notas > (mean(t1.3$media_notas)-sd(t1.3$media_notas)))

t0.4_ = t0.4 %>% filter(media_notas > (mean(t0.4$media_notas)-sd(t0.4$media_notas)))
t1.4_ = t1.4 %>% filter(media_notas > (mean(t1.4$media_notas)-sd(t1.4$media_notas)))

#reagrupando esses datasets:

df_final = rbind(t0.1_, t1.1_, t0.2_,t1.2_, t0.3_, t1.3_, t0.4_, t1.4_)
dim(df_final)

head(df_final)
plot(df_final$nota1, df_final$nota2, pch = 20, xlab  = 'Nota 1', ylab = 'Nota 2',
     main = 'Distribuição de notas após retirada de Outliers')

df_medias3 = df_final %>% group_by(Ano, tipo_ensino) %>% summarise(media = mean(media_notas))
df_medias3 = data.frame(df_medias3)
df_medias3

privada_ = df_medias3 %>% filter(tipo_ensino==0)
publica_ = df_medias3 %>% filter(tipo_ensino==1)

publica_
privada_

View(publica_)
View(privada_)

par(mfrow=c(1,1))
plot(publica_$Ano, publica_$media, xlab = 'Ano', ylab='Média', type = 'o', pch = 18, col= 'black',
     ylim=c(55,100), lwd = 2)
lines(privada_$Ano, privada_$media, type = 'o', pch = 20, col = 'red', lwd = 2)

head(df_final)

#criando, no df_final, uma coluna que indica "1" caso a nota2 > nota1; "0" cc.
df_final$desempenho = 0 
head(df_final)

as.numeric(df_final[1, c(1,2)])

for (i in c(1:nrow(df_final))){
  vec = as.numeric(df_final[i, c(1,2)])
  if (vec[1]<vec[2]){
    df_final[i,6] = 1
  }else{
    df_final[i,6] = -1
  }
}

head(df_final)
tail(df_final)

View(df_final)
str(df_final)

dff = data.frame(df_final %>% group_by(Ano, tipo_ensino, desempenho) %>% summarise(total = abs(sum(desempenho))))
dff

dff0 = dff %>% filter(tipo_ensino==0)
dff1 = dff %>% filter(tipo_ensino==1)

dff0
dff1

m0.0 = data.frame(dff0 %>% filter(desempenho==-1) %>% select(total))$total
m0.1 = data.frame(dff0 %>% filter(desempenho==1) %>% select(total))$total

m1.0 = data.frame(dff1 %>% filter(desempenho==-1) %>% select(total))$total
m1.1 = data.frame(dff1 %>% filter(desempenho==1) %>% select(total))$total


m0 = matrix(c(m0.0,m0.1), nrow = 2, byrow = T)
m1 = matrix(c(m1.0,m1.1), nrow = 2, byrow =  T)

m0
m1

par(mfrow=c(1,1))
barplot(m0, beside = T, col = c('royalblue3',colors()[200]), xlab = 'Ano',
        main = 'proporção de desempenho privado')
legend('topleft',c('negativo','positivo'),
       fill = c('royalblue3',colors()[200]))



par(mfrow=c(1,2))
barplot(m0, beside = T,col = c('royalblue3',colors()[200]), xlab = 'Ano',
        main = 'proporção de desempenho privado')
legend('topleft',c('negativo','positivo'),
       fill = c('royalblue3',colors()[200]))

barplot(m1, beside = T,col = c('royalblue3',colors()[200]), xlab = 'Ano',
        main = 'proporção de desempenho publico')
legend('topright',c('negativo','positivo'),
       fill = c('royalblue3',colors()[200]))

# FIM DA AULA 3