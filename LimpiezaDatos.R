#LIMPIEZA DE DATOS
library(naniar)
library(VIM)

#Analizar numero de NAs
datos<- read.csv("C:/Users/Larau/Downloads/netflix.csv")

#Por variable
miss_var_summary(datos)


#Visualizar distribucion
vis_miss(datos)
vis_miss(datos, cluster=T)

#La mayoria de NA-s se concentra en la misma variable "Season", y los restantes 
# en la vairbale minutes, conetniendo "Relesase_year" un pequeña cantidad de NA.
#visualizando la distribucion de los NA-s, se llega a entender que se trata de MNAR,
#Missing Not At Random, ya que los missing no estan de manera aleatoria distirbucion, sino que sigue un patron,
#gran parte de los na-s se cooncetrna en dos difenrtes variables ("SEason, "Minutes),
# en el caso de minutes la mayoria se encuentran apartir de la observacion 6000 y en el caso de Season
#la mayoria entre las observaciones 0-6000. Esto me da a entender que las priemras observaciones se tratan peliculas y conitnene tanto NA-s porque
#las peliculas no tienen season, en el caso de apartir de la 6000 observacion se puede concluir que s etrata de series y gran parte de ellas no contienen minutos.


#Imputacion de los NA-s

#---> IMPUTACION "SEASONS"
datos$Seasons<- ifelse(datos$type== "TV Show",datos$Seasons, 0)


#---> Imputacion "MINUTES"
datos<- kNN(datos, variable=c("Minutes", "Seasons"), dist_var=c("show_id", "type", "title", "director", "country",
                                                                "date_added", "release_year", "rating", "listed_in"), k=5)
sum(is.na(datos$Minutes))
#Eliminaremos la vairbale "minute_imp"
datos<- datos[,-c(12,13)]

sum(is.na(datos$Seasons))
#NOs quedmaos sin NA-s en ambas variables

miss_var_summary(datos)
