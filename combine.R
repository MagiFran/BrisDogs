####################################

#need to work on this part

Brisbane_dogs <- full_join(Brisbane, suburb_breeds_dogs, by = "suburb")

plot(Brisbane_dogs)

plot(Brisbane_dogs['Total Dogs'])
plot(Brisbane_dogs['Labrador Retriever'])
plot(Brisbane_dogs['Maltese'])
plot(Brisbane_dogs['Staffordshire Bull Terrier'])


plot(Brisbane_dogs['Siberian Husky'])
plot(Brisbane_dogs['German Shepherd Dog'])
plot(Brisbane_dogs['Bull Arab'])




filter(Brisbane_dogs, 'Siberian Husky' > 30)

##calculate dog density per suburb

Brisbane %>% 
  filter(suburb == "ALDERLEY")%>% 
  st_area()





Brisbane_dogs[is.na(Brisbane_dogs)] <- 0

#plot(Brisbane_dogs$total_dogs)

#plot(Brisbane_dogs[,2])

plot(Brisbane_dogs)

###########################

theme_set(theme_bw())
ggplot(data = Brisbane_dogs) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))



ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `Total Dogs`)) + 
  #scale_colour_gradient(low = "white", high = "black") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))


ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `Total Dogs`)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))


ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `Cavalier King Charles Spaniel`)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))


no_dogs <- filter(Brisbane_dogs, is.na(`Total Dogs`))
