library(tidyverse)
library(sf)

gadm_version <- "41"


# Load Clean RDS Files ----------------------------------------------------

gadm_ph_2prov <- read_rds(str_c("Shape Files/Clean/gadm", gadm_version, "_ph_2prov.rds"))
gadm_ph_2prov_v2 <- read_rds(str_c("Shape Files/Clean/gadm", gadm_version, "_ph_2prov_v2.rds"))
gadm_ph_3mun <- read_rds(str_c("Shape Files/Clean/gadm", gadm_version, "_ph_3mun.rds"))
gadm_ph_3mun_v2 <- read_rds(str_c("Shape Files/Clean/gadm", gadm_version, "_ph_3mun_v2.rds"))



# Test Visualize Clean RDS Files ------------------------------------------

gadm_ph_2prov %>%
    ggplot() + geom_sf(aes(fill = Region)) +
    theme_minimal() +
    theme(legend.position = "none")

gadm_ph_2prov_v2 %>%
    ggplot() + geom_sf(aes(fill = Region)) +
    theme_minimal() +
    theme(legend.position = "none")

gadm_ph_3mun %>%
    ggplot() + geom_sf(aes(fill = Region), color = "transparent") +
    theme_minimal() +
    theme(legend.position = "none")
