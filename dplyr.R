install.packages('dplyr')
library("dplyr")

n_s <-  starwars |> 
  mutate(new_height= ifelse(height>100, 
                            "tall",
                           "small")) |> 
  
  select(height, new_height, everything())

n_s


starwars |>  mutate(height_cat = ifelse(height > 100, "tall", "small")) |>
  ggplot(aes(x=height, fill = height_cat)) +
  geom_histogram()

library(ggplot2)
install.packages("ggplot2")

library(dplyr)


# Basic stats -------------------------------------------------------------

starwars |> summarise(mean_height= mean(height, na.rm=T))

starwars |> group_by(species) |> 
  summarise(
    mean_height = mean(height, na.rm = TRUE),
    sd_height = sd(height, na.rm = TRUE
                   ))

n_s %>%
  group_by(species) %>%
  summarise(
    mean_height = mean(height, na.rm = TRUE),
    sd_height = sd(height, na.rm = TRUE)
  )


n_s %>%
  group_by(new_height, homeworld) %>%
  summarise(
    mean_height = mean(height, na.rm = TRUE))


n_s |> 
  group_by(new_height) |> 
  count(homeworld)

