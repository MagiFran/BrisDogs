library(data.table)
library(tidyverse)


animal_permits <- fread("https://www.data.brisbane.qld.gov.au/data/dataset/b5ff5dc6-9749-44a0-8f7c-b8e34944ee4a/resource/c2823090-8a44-4c8b-9ed4-e988491b25f4/download/cars---bis---open-data---animal-permits-breed---3-oct-2018.csv",
  na.strings = "", stringsAsFactors = TRUE
)

# Fix Names
names(animal_permits) <- c("group", "type", "status", "breed", "suburb")

# types of permits
levels(animal_permits$type)

# permit record by type
animal_permits %>%
  group_by(type) %>%
  summarise(
    n = n()
  )

# look at Guard Dog Permits
animal_permits[type == "Guard Dog Permit"]

# check for na breed records
na_breed <- animal_permits[is.na(breed)]

# na record by type
na_breed %>%
  group_by(type) %>%
  summarise(
    n = n()
  )

# breed is only relevent to dog registration.
# there are only 7 dog registration records with breed missing

dog_rego <- animal_permits[type == "Dog Registration"]

# dog registrations by suburb
suburb_dogs <- dog_rego %>%
  filter(!is.na(suburb)) %>%
  group_by(suburb) %>%
  summarise(
    total_dogs = n()
  )

# Top dog breeds
top_breeds <- dog_rego %>%
  group_by(breed) %>%
  summarise(
    n = n()
  ) %>%
  top_n(3)

top_breedslist <- top_breeds$breed

# dog registrations by breed and suburb
dog_rego %>%
  group_by(suburb, breed) %>%
  summarise(
    n = n()
  )

levels(dog_rego$breed)

write.csv(dog_rego, "D:/R_Output/Brisbane_Dogs/dog_rego.")

suburb_dogs_topbreeds <- dog_rego %>%
  filter(breed %in% top_breedslist) %>%
  filter(!is.na(suburb)) %>%  
  group_by(suburb, breed) %>%
  summarise(
    n = n()
  ) %>%
  spread(breed, n)

suburb_dogs <- full_join(suburb_dogs, suburb_dogs_topbreeds, by = "suburb") 
 
