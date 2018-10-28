library(sf)
library(tidyverse)
library(ggplot2)
#library(RColorBrewer)
#library(ggplot2)

### Data Set
#####################################################################
###    Locality boundaries - Queensland                           ###
###    Identification                                             ###
###    Title: Locality boundaries - Queensland                    ###
###    Alternative title: Locality Boundaries                     ###
###    Date: 2018-08-27 (publication)                             ###
###    Online resource:                                           ###
###      Website: http://www.dnrm.qld.gov.au/mapping-data         ###
###    Related resource:                                          ###
###      Identifier: PROP.QLD_LOCALITYBDY_DCDB                    ###
###    Relationship to related resource: source                   ###
#####################################################################

Queensland <- st_read("D:/R_Input/Spatial_Files/QSC_Extracted_Data_20181021_185250899000-14996/Locality_Boundaries.shp")

#filter for brsibane local government area
Brisbane <- Queensland[,4:8] %>% filter(LGA == "Brisbane City") 

#provide upper case suburb
Brisbane <- cbind(suburb=toupper(Brisbane$LOCALITY),Brisbane[,2:5])


plot(Brisbane[,3])
#par(new=TRUE)
plot(st_centroid(Brisbane[1], of_largest_polygon = TRUE))
#par(new=TRUE)
#plot(Brisbane[,3], col = "grey", main = FALSE)

ggplot(data = Brisbane) +
  geom_sf()

theme_set(theme_bw())
ggplot(data = Brisbane) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane$suburb)), " localities)"))

ggplot(data = Brisbane) +
  geom_sf(color = "black", fill = "lightgreen") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane$suburb)), " localities)"))
