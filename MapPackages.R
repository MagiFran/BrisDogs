library(plotly)
library(sf)


mtcars<- mtcars
plot_ly(mtcars, x = mtcars$wt, y = mpg, z = mtcars$disp,
        mode = "markers", type = "scatter3d") #, 
       # color = mtcars$hp) #, size = mtcars$hp)


set.seed(2018-07-21)
temp <- rnorm(100, mean =  30, sd = 5)
pressue <- rnorm(100)
dtime <- 1:100

plot_ly(x= temp, y = pressue, z = dtime,
        type = "scatter3d", mode = "markers", color = temp)




plot_ly(mtcars, x = mtcars$wt, y = mpg, mode = "markers",
        type = "scatter", color = as.factor(mtcars$cyl), size = mtcars$hp)



### Start here

library(plotly)

plot_ly(Brisbane, type = "scatter", mode = "lines",
        showlegend = FALSE,
        color = I("#EBEBEB"),
        stroke = I("#7E7E7E")
        )

plot_ly(suburb_dogs_cnt, x = suburb_dogs_cnt$suburb, 
        y = suburb_dogs_cnt$`Total Dogs`,
        type = "bar")


plot_ly(suburb_dogbreeds_cnt, x = suburb_dogbreeds_cnt$suburb, 
        y = suburb_dogbreeds_cnt$n,
        color = suburb_dogbreeds_cnt$breed,
        showlegend = TRUE,
        type = "scatter",
        mode = "markers")


plot_ly(suburb_dogbreeds_cnt, x = suburb_dogbreeds_cnt$suburb, 
        y = suburb_dogbreeds_cnt$n,
        z = suburb_dogbreeds_cnt$breed,
        color = suburb_dogbreeds_cnt$breed,
        colors = "Purples",
        type = "scatter3d",
        mode = "markers",showlegend = FALSE)


plot_ly(
  Brisbane, 
  split = ~suburb,
  color = ~CA_AREA_SQ,
  alpha = 1,
  showlegend = FALSE,
  type = "scatter",
  mode = "lines",
  stroke = I("#7E7E7E")
)



###Franconia


data(franconia, package = "mapview")
plot_ly(franconia, split = ~NAME_ASCI)

plot_ly(
  franconia, 
  split = ~NAME_ASCI,
  color = ~SHAPE_AREA,
  alpha = 1,
  showlegend = FALSE,
  type = "scatter",
  mode = "lines",
  stroke = I("#7E7E7E")
)





