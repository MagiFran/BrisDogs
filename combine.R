####################################

#need to work on this part

Brisbane_dogs <- full_join(Brisbane, suburb_breeds, by = "suburb") %>%
  mutate(`dog density` = total/CA_AREA_SQ) 




plot(Brisbane_dogs)

plot(Brisbane_dogs['total'])
plot(Brisbane_dogs['Labrador Retriever'])
plot(Brisbane_dogs['Maltese'])
plot(Brisbane_dogs['Staffordshire Bull Terrier'])
plot(Brisbane_dogs['Siberian Husky'])
plot(Brisbane_dogs['German Shepherd Dog'])
plot(Brisbane_dogs['Bull Arab'])
plot(Brisbane_dogs['Beagle'])



#filter(Brisbane_dogs, 'Siberian Husky' > 30)
#
###calculate dog density per suburb
#
#Brisbane %>% 
#  filter(suburb == "ALDERLEY")%>% 
#  st_area()
#




##Brisbane_dogs[is.na(Brisbane_dogs)] <- 0

#plot(Brisbane_dogs$total)
#
#plot(Brisbane_dogs[,6])
#
#plot(Brisbane_dogs)

###########################

theme_set(theme_bw())
ggplot(data = Brisbane_dogs) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))



ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = total)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))


ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `Cavalier King Charles Spaniel`)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))


ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `Beagle`)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))

ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `Greyhound`)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))

ggplot(data = Brisbane_dogs) +
  geom_sf(aes(fill = `dog density`)) + 
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey90") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Brisbane map", subtitle = paste0("(", length(unique(Brisbane_dogs$suburb)), " localities)"))


#1 Labrador Retriever          9394
#2 Maltese                     8450
#3 Staffordshire Bull Terrier  6919
# plus pugs and greyhounds
#fancy code to make slicers and zoom?

# types of permits
levels(dog_rego$breed)


no_dogs <- filter(Brisbane_dogs, is.na(`total`))

no_dogs$suburb
