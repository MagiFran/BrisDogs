library(sf)
library(tidyverse)

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
#plot(st_centroid(Brisbane[1], of_largest_polygon = TRUE))



####################################

#need to work on this part

Brisbane_dogs <- full_join(suburb_dogs,Brisbane)

Brisbane_dogs[is.na(Brisbane_dogs)] <- 0

plot(Brisbane_dogs$total_dogs)

plot(Brisbane_dogs[,2])



