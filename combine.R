####################################

#need to work on this part

Brisbane_dogs <- full_join(Brisbane, suburb_breeds_dogs)

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





