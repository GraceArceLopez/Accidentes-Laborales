setwd("~/Accidentes-Laborales")

##############################################################################
#################usando http://www.deis.cl/estadisticas-laborales/ ############
###############################################################################

# Cómo descargar y leer un archivo excel con R

# Librería para descargar la información
# install.packages("RCurl")

# Librería para leer excel
# install.packages("readxl")
#install.packages("ggplot2")

# Usando las Librerías
library(RCurl)
library(readxl) 
library(ggplot2)

# Descargando el archivo Excel
# download.file(URL_file ,destfile=Nombre_Local ,mode="wb")
# URL_file: ubicación del archivo a descargar
# Nombre_Local: nombre que tomará el archivo cuando lo descarge
# mode="wb" modo para que el archivo no sea modificado y no tenga problemas al leerlo

download.file("http://www.deis.cl/wp-content/uploads/2018/10/Accidentes-laborales-fatales-2007-2016.xlsx",destfile="Accidentes-laborales-fatales-2007-2016.xlsx",mode="wb")

# Leyendo el Excel
excelALF2007a2016 <- read_excel("Accidentes-laborales-fatales-2007-2016.xlsx")

# Viendo el contenido de la variable excelALF2007a2016
print(excelALF2007a2016)

# Leyendo el excel con rangos definidos
excelALF2007a2016DefYMor1 <- read_excel("Accidentes-laborales-fatales-2007-2016.xlsx",range = "B8:H18")
excelALF2007a2016DefYMor2 <- read_excel("Accidentes-laborales-fatales-2007-2016.xlsx",range = "J7:P18")

# Viendo el contenido de la variable excelALF2007a2016DefYMor 1 y 2
print(excelALF2007a2016DefYMor1)
print(excelALF2007a2016DefYMor2)

# Convirtiendo a data frame
dfALF2007a2016DefYMor1 <- as.data.frame(excelALF2007a2016DefYMor1)
dfALF2007a2016DefYMor2 <- as.data.frame(excelALF2007a2016DefYMor2)

#Almacenando la información en 
write.table(dfALF2007a2016DefYMor1, file="dfALF2007a2016DefYMor1.txt")
write.table(dfALF2007a2016DefYMor2, file="dfALF2007a2016DefYMor2.txt")

#Almacenando la información en csv
write.csv(dfALF2007a2016DefYMor1, file="dfALF2007a2016DefYMor1.csv")
write.csv(dfALF2007a2016DefYMor2, file="dfALF2007a2016DefYMor2.csv")

# Leyendo el excel con rangos definidos y otro sheet o hoja
excelALF2007a2016Tabla1 <- read_excel("Accidentes-laborales-fatales-2007-2016.xlsx", range = "Tabla 1!A7:BJ25")
excelALF2007a2016Tabla6 <- read_excel("Accidentes-laborales-fatales-2007-2016.xlsx", range = "Tabla6!A7:BJ28")

# Viendo el contenido de la variable excelALF2007a2016Tabla1
print(excelALF2007a2016Tabla1)
print(excelALF2007a2016Tabla6)

# Convirtiendo a data frame
dfALF2007a2016Tabla1 <- as.data.frame(excelALF2007a2016Tabla1)
dfALF2007a2016Tabla6 <- as.data.frame(excelALF2007a2016Tabla6)
#dfALF2007a2016Tabla6$

dfALF2007a2016Tabla6 %>%
  ggplot() +
  aes(x = X__1, y = `2007`) +
  geom_bar(stat="identity")


write.table(dfALF2007a2016Tabla1, file="dfALF2007a2016Tabla1.txt")
write.table(dfALF2007a2016Tabla6, file="dfALF2007a2016Tabla6.txt")
######################################################################################
###Extrayendo titulos sobre accidentes laborales de https://www.laizquierdadiario.cl/#
######################################################################################

# Usando la librerÃ�a rvest
library('rvest')

# inicializando la variable archivo con el nombre de mi pÃ¡gina
Archivo <- 'https://www.laizquierdadiario.cl/muertes-por-accidentes-laborales?id_rubrique=1201'

# Leyendo el HTML del archivo
BlogAL <- read_html(Archivo)

# Extrayendo contenido en la clase justificado
NoticiasAL <- html_nodes(BlogAL,'h3')

# Pasando la info a texto
TitilosNoticias <- html_text(NoticiasAL)

# Viendo a priori la info en la variable textoNoticia
print(TitilosNoticias)

#Convirtiendo a data frame

dfTitulosNoticia <- as.data.frame(TitilosNoticias)

# o en un txt
write.table(dfTitulosNoticia, file="TituloNoticia.txt")



