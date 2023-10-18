###World map
library(plotly)

Af <- read.csv("Happiness2018.csv")


# change default color scale title
m <- list(colorbar = list(title = "Total Inches"))

# geo styling
g <- list(
  scope = 'world',
  showland = TRUE,
  landcolor = toRGB("grey83"),
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white"),
  showlakes = TRUE,
  lakecolor = toRGB("white"),
  showsubunits = TRUE,
  showcountries = TRUE,
  resolution = 50,
  projection = list(
    type = 'Equirectangular',
    rotation = list(lon = 0)
  ),
  lonaxis = list(
    showgrid = TRUE,
    gridwidth = 0.5,
    range = c(-180, 180),
    dtick = 5
  ),
  lataxis = list(
    showgrid = TRUE,
    gridwidth = 0.5,
    range = c(-80, 80),
    dtick = 5
  )
)

fig <- plot_geo(Af, lat = ~Latitude, lon = ~Longitude, color = ~Happiness.scores)
fig <- fig %>% add_markers(
  text = ~paste(Country, Af$Happiness.scores), hoverinfo = "text"
)
fig <- fig %>% layout(title = 'Happiness scores in 2018', geo = g)

fig

# set plotly user name
Sys.setenv("plotly_username"="dddddddwei")
# set plotly API key
Sys.setenv("plotly_api_key"="GBBkblltTNdSvaoBJNpx")
chart_link<- api_create(fig)
chart_link




##Correlation plot
library(plotly)

d <- data.frame(
  ids=c(
    "North America","South America", "Asia","Africa","Europe",  
    "North America - GDP", "North America - Freedom to make choice", 
    "North America - Perceptions of corruption","North America - Generosity",
    "North America - Healthy life expectancy","North America - Social support",
    "South America - GDP", "Southth America - Freedom to make choice", 
    "South America - Perceptions of corruption","Southth America - Generosity",
    "South America - Healthy life expectancy","Southth America - Social support",
    "Asia - GDP", "Asia - Freedom to make choice", 
    "Asia - Perceptions of corruption","Asia - Generosity",
    "Asia - Healthy life expectancy","Asia - Social support",
    "Africa - GDP", "Africa - Freedom to make choice", 
    "Africa - Perceptions of corruption","Africa - Generosity",
    "Africa - Healthy life expectancy","Africa - Social support",
    "Europe - GDP", "Europe - Freedom to make choice", 
    "Europe - Perceptions of corruption","Europe - Generosity",
    "Europe - Healthy life expectancy","Europe - Social support"
  ),
  labels = c(
    "North<br>America","South<br>America", "Asia","Africa","Europe", 
    "GDP", "Freedom<br>to<br>make<br>choice", 
    "Perceptions<br>of<br>corruption","Generosity",
    "Healthy<br>life<br>expectancy","Social<br>support",
    "GDP", "Freedom<br>to<br>make<br>choice", 
    "Perceptions<br>of<br>corruption","Generosity",
    "Healthy<br>life<br>expectancy","Social<br>support",
    "GDP", "Freedom<br>to<br>make<br>choice", 
    "Perceptions<br>of<br>corruption","Generosity",
    "Healthy<br>life<br>expectancy","Social<br>support",
    "GDP", "Freedom<br>to<br>make<br>choice", 
    "Perceptions<br>of<br>corruption","Generosity",
    "Healthy<br>life<br>expectancy","Social<br>support",
    "GDP", "Freedom<br>to<br>make<br>choice", 
    "Perceptions<br>of<br>corruption","Generosity",
    "Healthy<br>life<br>expectancy","Social<br>support"
    
  ),
  parents = c("", "", "","", "",  "North America","North America","North America","North America","North America","North America",
              "South America","South America","South America","South America","South America","South America",
              "Asia","Asia","Asia","Asia","Asia","Asia",
              "Africa","Africa","Africa","Africa","Africa","Africa",
              "Europe","Europe","Europe","Europe","Europe","Europe"
              
  ),
  values = c(6.08, 5.92, 5.248,4.50 , 6.29, 0.79,0.88,0.27,0.54,0.93,0.83,0.47,0.61,0.36,0.41,0.45,0.08,0.72,0.53,0.25,0.08,0.70,0.71,0.70,0.31,0.07,0.04,0.57,0.62,0.81,0.79,0.82,0.55,0.69,0.64)
  
)

fig <- plot_ly(d, ids = ~ids, labels = ~labels, parents = ~parents,values=~values, type = 'sunburst',branchvalues = 'total')

fig
Sys.setenv("plotly_username"="dddddddwei")
# set plotly API key
Sys.setenv("plotly_api_key"="GBBkblltTNdSvaoBJNpx")
chart_link<- api_create(fig)
chart_link


###Radar plot
library(plotly)

fig <- plot_ly(
  type = 'scatterpolar',
  fill = 'toself'
) 
fig <- fig %>%
  add_trace(
    r = c(1.2269,1.43075,0.9249,0.40905,0.174,0.131),
    theta = c('GDP','Social support','Healthy life expectancy', 'Freedom to make choices', 'Generosity', 'Percepions of corruption'),
    name = 'Europe'
  ) 
fig <- fig %>%
  add_trace(
    r = c(0.940170732,1.195121951,0.74804878,0.404439024,0.214658537,0.105804878),
    theta = c('GDP','Social support','Healthy life expectancy', 'Freedom to make choices', 'Generosity', 'Percepions of corruption'),
    name = 'Asia'
  ) 
fig <- fig %>%
  add_trace(
    r = c(0.600521739,0.982608696,0.516282609,0.344673913,0.183695652,0.095195652),
    theta = c('GDP','Social support','Healthy life expectancy', 'Freedom to make choices', 'Generosity', 'Percepions of corruption'),
    name = 'Africa'
  ) 
fig <- fig %>%
  add_trace(
    r = c(0.883363636,1.304545455,0.820909091,0.455545455,0.178636364,0.102181818),
    theta = c('GDP','Social support','Healthy life expectancy', 'Freedom to make choices', 'Generosity', 'Percepions of corruption'),
    name = 'NorthAmerica'
  ) 
fig <- fig %>%
  add_trace(
    r = c(0.9827,1.3812	,.8345,0.4343,0.1172,0.0681),
    theta = c('GDP','Social support','Healthy life expectancy', 'Freedom to make choices', 'Generosity', 'Percepions of corruption'),
    name = 'SouthAmerica'
  ) 
fig <- fig %>%
  layout(
    polar = list(
      radialaxis = list(
        visible = T,
        range = c(0,1.5)
      )
    )
  )

fig
Sys.setenv("plotly_username"="dddddddwei")
# set plotly API key
Sys.setenv("plotly_api_key"="GBBkblltTNdSvaoBJNpx")
chart_link<- api_create(fig)
chart_link


###Bar plot
library(plotly)

y <- c('Happiness scores [4,5]', 'Happiness scores [5,5.5]', 'Happiness scores [5.5,6]','Happiness scores [6,6.5]','Happiness scores [6.5,7]','Happiness scores [7,7.5]','Happiness scores [7.5,8]')
GDP <- c(0.8835, 1.088, 1.096125,1.203888889, 1.3244, 1.3244,1.403666667)
Socialsupport <- c(1.119, 1.3224, 1.41975,1.404333333,1.4874,1.5255,1.580666667)
Healthylifeexpectancy <- c(0.8065,0.8724,0.837875,0.918,0.9874,1.013625, 1.003333333)
Freedomtomakechoices <- c(0.2805, 0.2242,0.3155,0.402444444,0.485,0.53975,0.597)
Generosity <- c(0.1825, 0.1114, 0.106,0.141222222,0.1906,0.28625,0.225333333)
Perceptionsofcorruption <- c(0.0185, 0.0416,0.0525,0.036,0.169,0.28275, 0.381333333)
data <- data.frame(y, GDP, Socialsupport,Healthylifeexpectancy,Freedomtomakechoices,Generosity,Perceptionsofcorruption)

fig <- plot_ly(data, x = ~GDP, y = ~y, type = 'bar', orientation = 'h', name = 'GDP',
               marker = list(color = 'rgba(38, 24, 74, 0.8)',
                             line = list(color = 'rgba(38, 24, 74, 0.8)',
                                         width = 3)))
fig <- fig %>% add_trace(x = ~Socialsupport, name = 'Socialsupport',
                         marker = list(color = 'rgba(71, 58, 131, 0.8)',
                                       line = list(color = 'rgba(58, 71, 80, 1.0)',
                                                   width = 3)))
fig <- fig %>% add_trace(x = ~Healthylifeexpectancy, name = 'Healthylifeexpectancy',
                         marker = list(color = 'rgba(122, 120, 168, 0.8)',
                                       line = list(color = 'rgba(58, 71, 80, 1.0)',
                                                   width = 3)))
fig <- fig %>% add_trace(x = ~Freedomtomakechoices, name = 'Freedomtomakechoices',
                         marker = list(color = 'rgba(164, 163, 204, 0.85)',
                                       line = list(color = 'rgba(58, 71, 80, 1.0)',
                                                   width = 3)))
fig <- fig %>% add_trace(x = ~Generosity, name = 'Generosity',
                         marker = list(color = 'rgba(194, 197, 204, 0.85)',
                                       line = list(color = 'rgba(58, 71, 80, 1.0)',
                                                   width = 3)))
fig <- fig %>% add_trace(x = ~Perceptionsofcorruption, name = 'Perceptionsofcorruption',
                         marker = list(color = 'rgba(210, 215, 219, 1)',
                                       line = list(color = 'rgba(58, 71, 80, 1.0)',
                                                   width = 3)))
fig <- fig %>% layout(barmode = 'stack',
                      xaxis = list(title = ""),
                      yaxis = list(title =""))

fig


###mix plot
library(plotly)

y <- c('GDP','Social support','Healthy life expectancy', 'Freedom to make choices', 'Generosity', 'Percepions of corruption')
x_saving <- c(0.600521739	,0.982608696,	0.516282609,	0.344673913	,0.183695652,	0.095195652)
x_net_worth <- c(0.902262821,	1.209391026,	0.725371795,	0.392980769,	0.186237179,	0.110160256)
perc<- c(66.66,81.31,71.2,87.71,98.63,86.36)
data <- data.frame(y, x_saving, x_net_worth,perc)

fig1 <- plot_ly(x = ~x_saving, y = ~reorder(y, x_saving), name = 'Avearge levels of six factors in Africa',
                type = 'bar', orientation = 'h',
                marker = list(color = 'rgba(50, 171, 96, 0.6)',
                              line = list(color = 'rgba(50, 171, 96, 1.0)', width = 1))) 
fig1 <- fig1 %>% layout(yaxis = list(showgrid = FALSE, showline = FALSE, showticklabels = TRUE, domain= c(0, 0.85)),
                        xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE)) 
fig1 <- fig1 %>% add_annotations(xref = 'x1', yref = 'y',
                                 x = x_saving * 2.1 + 3,  y = y,
                                 text = paste(perc, '%'),
                                 font = list(family = 'Arial', size = 12, color = 'rgb(50, 171, 96)'),
                                 showarrow = FALSE)

fig2 <- plot_ly(x = ~x_net_worth, y = ~reorder(y, x_saving), name = 'average levels of six factors in the world',
                type = 'scatter', mode = 'lines+markers',
                line = list(color = 'rgb(128, 0, 128)')) 
fig2 <- fig2 %>% layout(yaxis = list(showgrid = FALSE, showline = TRUE, showticklabels = FALSE,
                                     linecolor = 'rgba(102, 102, 102, 0.8)', linewidth = 2,
                                     domain = c(0, 0.85)),
                        xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE,
                                     side = 'top', dtick = 25000)) 
fig2 <- fig2 %>% add_annotations(xref = 'x2', yref = 'y',
                                 x = x_net_worth, y = y,
                                 text = paste(x_net_worth),
                                 font = list(family = 'Arial', size = 12, color = 'rgb(128, 0, 128)'),
                                 showarrow = FALSE)

fig <- subplot(fig1, fig2) 
fig <- fig %>% layout(title = 'Avearge levels of six factors in Africa  & in the world',
                      legend = list(x = 0.029, y = 1.038,
                                    font = list(size = 10)),
                      margin = list(l = 100, r = 20, t = 70, b = 70),
                      paper_bgcolor = 'rgb(248, 248, 255)',
                      plot_bgcolor = 'rgb(248, 248, 255)')
fig <- fig %>% add_annotations(xref = 'paper', yref = 'paper',
                               x = -0.14, y = -0.15,
                               text = paste('World happiness in 2018)'),
                               font = list(family = 'Arial', size = 10, color = 'rgb(150,150,150)'),
                               showarrow = FALSE)

fig

Sys.setenv("plotly_username"="dddddddwei")
# set plotly API key
Sys.setenv("plotly_api_key"="GBBkblltTNdSvaoBJNpx")
chart_link<- api_create(fig)
chart_link





fig <- plot_ly(
  type = "funnel",
  name = 'Europe',
  y = c("Happiness scores [3,8]", "Happiness scores [4,8]", "Happiness scores [5,8]","Happiness scores [6,8]","Happiness scores [7,8]"),
  x = c( 41, 41,39 ,26,12),
  textinfo = "value+percent initial") 
fig <- fig %>%
  add_trace(
    type = "funnel",
    name = 'Asia',
    orientation = "h",
    y = c("Happiness scores [3,8]", "Happiness scores [4,8]", "Happiness scores [5,8]","Happiness scores [6,8]","Happiness scores [7,8]"),
    x = c(40, 38, 36, 9, 1),
    textposition = "inside",
    textinfo = "value+percent previous") 
fig <- fig %>%
  add_trace(
    type = "funnel",
    name = 'Africa',
    orientation = "h",
    y = c("Happiness scores [3,8]", "Happiness scores [4,8]", "Happiness scores [5,8]","Happiness scores [6,8]","Happiness scores [7,8]"),
    x = c(47, 34, 11, 3, 0),
    textposition = "outside",
    textinfo = "value+percent total") 
fig <- fig %>%
  add_trace(
    type = "funnel",
    name = 'NorthAmerica',
    orientation = "h",
    y = c("Happiness scores [3,8]", "Happiness scores [4,8]", "Happiness scores [5,8]","Happiness scores [6,8]","Happiness scores [7,8]"),
    x = c(10, 10, 9, 6, 0),
    textposition = "outside",
    textinfo = "value+percent total") 
fig <- fig %>%
  add_trace(
    type = "funnel",
    name = 'SouthAmerica',
    orientation = "h",
    y = c("Happiness scores [3,8]", "Happiness scores [4,8]", "Happiness scores [5,8]","Happiness scores [6,8]","Happiness scores [7,8]"),
    x = c(11, 10, 10, 7, 2),
    textposition = "outside",
    textinfo = "value+percent total") 
fig <- fig %>%
  layout(yaxis = list(categoryarray = c("Happiness scores [3,8]", "Happiness scores [4,8]", "Happiness scores [5,8]","Happiness scores [6,8]","Happiness scores [7,8]")))

fig


Sys.setenv("plotly_username"="dddddddwei")
# set plotly API key
Sys.setenv("plotly_api_key"="GBBkblltTNdSvaoBJNpx")
chart_link<- api_create(fig)
chart_link















