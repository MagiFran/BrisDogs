library(data.table)
library(tidyverse)


animal_permits <- fread("https://www.data.brisbane.qld.gov.au/data/dataset/b5ff5dc6-9749-44a0-8f7c-b8e34944ee4a/resource/c2823090-8a44-4c8b-9ed4-e988491b25f4/download/cars---bis---open-data---animal-permits-breed---3-oct-2018.csv",
  na.strings = "", stringsAsFactors = TRUE
)

# Fix Names
names(animal_permits) <- c("group", "type", "status", "breed", "suburb")

# breed is only relevent to dog registration.
# there are only 7 dog registration records with breed missing other records have "Unknown"

dog_rego <- animal_permits[type == "Dog Registration"]

dog_rego[is.na(dog_rego$breed)] <- "Unknown"
  
# dog registrations by breed and suburb- breeds into columns
# start with dog_rego and write to new df
# remove records where suburb is na
# sumarise by suburb and breed as a percentage of dog pop for suburb
# wide data set

suburb_breeds <- dog_rego %>%
  filter(!is.na(suburb) & !is.na(breed)) %>%
  group_by(suburb, breed) %>%
  summarise(
    n = n()
  ) %>%
  group_by(suburb) %>%
  mutate(total = sum(n)) %>%
  mutate(pct = n/total*100) %>%
  select(-n) %>%
  spread(breed, pct, fill = NA, convert = FALSE, drop = TRUE, sep = NULL )

# dog registrations by suburb
suburb_dogs_cnt <- dog_rego %>%
  filter(!is.na(suburb)) %>%
  group_by(suburb) %>%
  summarise(
    'Total Dogs' = n()
  )

# dog rego by breed and suburb - long form
suburb_dogbreeds_cnt <- dog_rego %>%
  filter(!is.na(suburb) & !is.na(breed)) %>%
  group_by(suburb, breed) %>%
  summarise(
    n = n()
  )


##############################################################
# Data Exploration working

dog_rego[is.na(dog_rego$suburb)]




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
# na breed record by type
animal_permits[is.na(breed)] %>%
  group_by(type) %>%
  summarise(
    n = n()
  )



# Top dog breeds
dog_rego %>%
  group_by(breed) %>%
  summarise(
    n = n()
  ) %>%
  top_n(10)





#suburb_breeds_dogs <- full_join(suburb_breeds, suburb_dogs, by = "suburb")

  ## put totals on the end
  ## calculate dog breed as percentage of total

levels(dog_rego$breed)

#write.csv(dog_rego, "D:/R_Output/Brisbane_Dogs/dog_rego.")

#suburb_dogs_topbreeds <- dog_rego %>%
#  filter(breed %in% top_breedslist) %>%
#  filter(!is.na(suburb)) %>%
#  group_by(suburb, breed) %>%
#  summarise(
#    n = n()
#  ) %>%
#  spread(breed, n)
#
#suburb_dogs <- full_join(suburb_dogs, suburb_dogs_topbreeds, by = "suburb")
#