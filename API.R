#API

library(plumber)

#* @apiTitle Tranformacion de Datos
#* @apiDescription Transformacion de los datos (Logaritmica, Normalizacion, Histograma de la variable Duration). Elige True (T) para visualizar el histograma de la variable Minutes logaritmicamente, y False (F) para la minutes sin tranformar
#* @param Transformacion (T / F)
#* @get /Histograma

function(Transformacion){
  data<- read.csv("C:/Users/Larau/Downloads/netflix.csv")
  variable_minute<- data$Minutes
  variable_cambiada<- log(variable_minute)
  if(Transformacion == T){
    histograma_variable_trans<- hist(variable_cambiada)
    return(histograma_variable_trans)
  } else{
    histograma_variables<- hist(variable_minute)
    return(histograma_variables)
  }
}