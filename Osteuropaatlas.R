library(imregr)
library(showtext)
library(gridExtra)

setwd(glue("C:/Users/sgraefe/Desktop/Osteuropaatlas"))

source(file = "Funktionen/read_data.R")
source(file = "Funktionen/plot_helper.R")
source(file = "Funktionen/plot_layer.R")
source(file = "Funktionen/plot_map.R")


read_data("Arbeitsstunden_NAMA_10R_2EMHRW") %>% mutate(value = `2020`/1000, delta = (`2020`/`2010`-1)*100) %>% plot_map(name ="Arbeitszeit", unit = "h")
