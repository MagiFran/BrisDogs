library(plotly)
library(sf)


library(plotly)
plot_ly(z = ~volcano)


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



# more dplyr verbs applied to plotly objects
p <- mtcars %>%
  plot_ly(x = ~wt, y = ~mpg, name = "scatter trace") %>%
  add_markers()
p %>% slice(1) %>% plotly_data()
p %>% slice(1) %>% add_markers(name = "first observation")
p %>% filter(cyl == 4) %>% plotly_data()
p %>% filter(cyl == 4) %>% add_markers(name = "four cylinders")


###############################
library(plotly)

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
### 
plot_ly(dog_rego,
        type = 'scatter',
        mode = 'markers',      
        x = ~suburb,

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

plot_ly(suburb_dogbreeds_cnt, x = ~suburb, 
        y = ~n,
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
)%>%
  filter(suburb != 'MORETON BAY')



plot_ly(Brisbane, type = "scatter", mode = "lines",
        showlegend = FALSE,
        color = I("#EBEBEB"),
        stroke = I("#7E7E7E")
)



####################Working Map################
plot_ly(
  Brisbane, 
  split = ~suburb,
  alpha = 1,
  showlegend = FALSE,
  type = "scatter",
  mode = "lines",
  color = I("#EBEBEB"),
  stroke = I("#7E7E7E")
)%>%
  filter(suburb != 'MORETON BAY')
 
#demo(package = "plotly") 
#sf-dt                         Linked querying of simple features with DT (datatables)
#sf-geo                        Mapping sf objects with scattergeo
#sf-ggplot2                    Mapping sf objects via ggplot2 and geom_sf()
#sf-mapbox-data                Mapping sf objects with mapbox
#sf-mapbox-layout              Mapping sf objects with mapbox (as a layer)
#sf-mapbox-style               Including a dropdown for mapbox's basemap style
#sf-plotly-3D-globe            Exploring storms paths by linking a 3D globe with a 2D
#                              summary
#sf-plotly-storms              Linking multiple 2D views of 3D storm paths


plot_mapbox(Brisbane)



plot_ly(color = I("#EBEBEB"), stroke = I("#7E7E7E"))%>%
  add_data(Brisbane['suburb'])%>%
  filter(suburb != 'MORETON BAY')%>%
  add_trace(suburb_dogbreeds_cnt
          
          
          
          
          ,
          x = ~suburb,
          y = ~n,
          type = "scatter",
          mode = "markers",
          transforms = list(
            list(
              type = 'aggregate',
              groups = ~suburb, #~breed,
              aggregations = list(
                list(
                  target = 'y', func = 'sum', enabled = TRUE
                )
              )
            )
          )
  )




%>%
  add_lines(color = I("#EBEBEB"))

  add_data(suburb_dogbreeds_cnt)%>%
  add_trace()


#################Working Summary

plot_ly(suburb_dogbreeds_cnt,
        x = ~suburb,
        y = ~n,
        type = "scatter",
        mode = "markers",
        transforms = list(
          list(
            type = 'aggregate',
            groups = ~suburb, #~breed,
            aggregations = list(
              list(
                target = 'y', func = 'sum', enabled = TRUE
              )
            )
          )
        )
)






plot_ly(suburb_dogbreeds_cnt,
        #split = ~suburb,
        x = ~breed,
        y= ~n,
        type = "scatter",
        mode = "markers",
        transforms = list(
          list(
            type = 'aggregate',
            groups = ~breed,
            aggregations = list(
              list(
                target = 'y', func = 'sum', enabled = TRUE
              )
            )
          )
        )
        )


%>%
  layout(
    title = 'Number of dogs in BrisVegas',
    xaxis = list(title = 'Suburb'),
    yaxis = list(title = 'Number of Dogs'),
    updatemenus = list(
      list(
        x = 0.25,
        y = 1.04,
        xref = 'paper',
        yref = 'paper',
        yanchor = 'top',
        buttons = l
      )
    )
  )







trans

all_suburbs%>%
  add_data(dog_rego,

           aggregations = list(
             list(
               target = 'y', func = 'count', enabled = T
             ))
  )




      
plot_ly(suburb_dogbreeds_cnt,
        type = "scatter",
        mode = "markers",
        x = ~breed,
        y = ~n,
        color = n,
        aggregations = list(
          list(
            target = 'y', func = 'sum', enabled = T
             )
          )
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





