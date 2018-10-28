library(data.table)
library(tidyverse)


animal_permits <- fread("https://www.data.brisbane.qld.gov.au/data/dataset/b5ff5dc6-9749-44a0-8f7c-b8e34944ee4a/resource/c2823090-8a44-4c8b-9ed4-e988491b25f4/download/cars---bis---open-data---animal-permits-breed---3-oct-2018.csv",
                        na.strings = "", stringsAsFactors = TRUE
)

# Fix Names
names(animal_permits) <- c("group", "type", "status", "breed", "suburb")

# breed is only relevent to dog registration.
# there are only 7 dog registration records with breed missing

dog_rego <- animal_permits[type == "Dog Registration"]

# dog registrations by breed and suburb- breeds into columns
# start with dog_rego and write to new df
# remove records where breed or suburb is na
# sumarise by suburb and breed as a percentage of dog pop for suburb


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