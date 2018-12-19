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



###############################
ibrary(plotly)

p <- plot_ly(
  type = 'scatter',
  x = mtcars$hp,
  y = mtcars$qsec,
  text = rownames(mtcars),
  hoverinfo = 'text',
  mode = 'markers',
  transforms = list(
    list(
      type = 'filter',
      target = 'y',
      operation = '>',
      value = mean(mtcars$qsec)
    )
  )
)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link <- api_create(p, filename = "filter-basic")
chart_link


########################





dog_rego[breed == "Shih Tzu"]

p1 <- dog_rego %>%
  filter(!is.na(suburb)) %>%
  group_by(suburb) %>%
  summarise(
    n = n()
  ) %>%
  arrange(n)%>%
  plot_ly( y = ~suburb, x = ~n, type = "bar", orientation = 'h'
           )

p2 <- dog_rego %>%
  filter(!is.na(suburb)) %>%
  group_by(breed) %>%
  summarise(
    n = n()
  ) %>%
  arrange(n)%>%
  plot_ly( y = ~breed, x = ~n, type = "bar", orientation = 'h'
  )

subplot(p1, p2)

l <- as.list(levels(dog_rego$breed))

###plotly aggregation
plot_ly(dog_rego,
  type = 'scatter',
  x = ~breed,
  #split = ~suburb,
  mode = 'markers',
  transforms = list(
    list(
      type = 'aggregate',
      groups = ~breed,
      aggregations = list(
        list(
          target = 'y', func = 'count', enabled = T
        )
      )
    )
  )
)




split = ~suburb
### doesn't work
plot_ly(dog_rego,
        type = 'bar',
        orientation = 'v',
        legendgroup = l,
        showlegend = TRUE,
        x = ~suburb,
        mode = 'markers',
        transforms = list(
          list(
            type = 'aggregate',
            groups = ~suburb,
            aggregations = list(
              list(
                target = 'y', func = 'count', enabled = T
              )
            )
          )
        )
)




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





