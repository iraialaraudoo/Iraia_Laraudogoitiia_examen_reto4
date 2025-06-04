#Explocaion y Analisis de los datos

#Cargar librerias 
library(dplyr)
library(lubridate)

#Cargar datos
datos<- read.csv("C:/Users/Larau/Downloads/netflix.csv")

#Analizar datos
str(datos)
dim(datos)
summary(datos)
head(datos)
colnames(datos)

#Completar tabla
datos_min_sin_NA<-na.omit(datos$Minutes)
summary(datos_min_sin_NA)
sum(is.na(datos$Minutes))
sd_minutes<- sd(datos$Minutes, na.rm=T)


datos_season_sin_NA<-na.omit(datos$Seasons)
summary(datos_season_sin_NA)
sum(is.na(datos$Seasons))
sd_season<- sd(datos$Seasons, na.rm=T)


#Elementos unicos
length(unique(datos$type))
length(unique(datos$country))
length(unique(datos$director))
