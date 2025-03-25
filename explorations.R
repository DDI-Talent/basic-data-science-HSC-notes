library(tidyverse)

# spelling mistake
typo = cancelled_messy %>% 
  filter(Measure == "TotalOprations")

# Grampian data
grampian = cancelled_messy %>% 
  select(Month, Measure, "NHS Grampian")

# sort data by month
sorted_month = cancelled_messy %>% 
  arrange(desc(Month))

# fix spelling mistake
cancelled_messy = cancelled_messy %>% 
  mutate(Measure = str_replace(Measure, "Opration", "Operation"))

# create a "tidy" dataset
cancelled_tidy = cancelled_messy %>% 
  pivot_longer(cols = "NHS Ayrshire and Arran":"The Golden Jubilee National Hospital", names_to = "healthboard") %>% 
  pivot_wider(names_from = Measure, values_from = value)

# plot exploration
cancelled_tidy %>% 
  ggplot(aes(x = Month, y = TotalOperations)) +
  geom_point()

# explore max total operations
check_totalop = cancelled_tidy %>% 
  arrange(desc(TotalOperations)) %>% 
  filter(healthboard == "NHS Grampian")

# fix mistaken high value
cancelled_data = cancelled_tidy %>% 
  mutate(TotalOperations = replace(TotalOperations, TotalOperations == 356666, 3566))

# plot exploration
cancelled_data %>% 
  ggplot(aes(x = Month, y = NonClinicalCapacityReason, group = healthboard, colour = healthboard)) +
  geom_line()

# check sum of total cancelled operations
check_totals = cancelled_data %>% 
  mutate(totals_check = CancelledByPatientReason + ClinicalReason + NonClinicalCapacityReason + OtherReason) %>% 
  filter(TotalCancelled != totals_check)
