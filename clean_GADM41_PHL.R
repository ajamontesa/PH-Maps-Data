library(tidyverse)
library(sf)

gadm_version <- "41"


# Load Shape Files --------------------------------------------------------

gadm_PH0 <- read_sf(str_c("Shape Files/gadm41_PHL_shp/gadm", gadm_version, "_PHL_0.shp"))
gadm_PH1 <- read_sf(str_c("Shape Files/gadm41_PHL_shp/gadm", gadm_version, "_PHL_1.shp"))
gadm_PH2 <- read_sf(str_c("Shape Files/gadm41_PHL_shp/gadm", gadm_version, "_PHL_2.shp"))
gadm_PH3 <- read_sf(str_c("Shape Files/gadm41_PHL_shp/gadm", gadm_version, "_PHL_3.shp"))


# NCR ---------------------------------------------------------------------

prov_ncr <- gadm_PH1 %>%
    filter(NAME_1 == "Metropolitan Manila") %>%
    transmute(Code = str_c("PH", str_pad("1300", 4, "left", "0"), "00000"),
              Region = "National Capital Region (NCR)",
              Province = "Metropolitan Manila")

mun_ncr <- gadm_PH2 %>%
    filter(NAME_1 == "Metropolitan Manila") %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "National Capital Region (NCR)",
              Province = "Metropolitan Manila",
              Municipality = NAME_2)


# Region I ----------------------------------------------------------------

R01_list <- c("Ilocos Norte", "Ilocos Sur", "La Union", "Pangasinan")

prov_r01 <- gadm_PH1 %>%
    filter(NAME_1 %in% R01_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region I (Ilocos Region)",
              Province = NAME_1)

mun_r01 <- gadm_PH2 %>%
    filter(NAME_1 %in% R01_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region I (Ilocos Region)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region II ---------------------------------------------------------------

R02_list <- c("Batanes", "Cagayan", "Isabela", "Nueva Vizcaya", "Quirino")

prov_r02 <- gadm_PH1 %>%
    filter(NAME_1 %in% R02_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region II (Cagayan Valley)",
              Province = NAME_1)

mun_r02 <- gadm_PH2 %>%
    filter(NAME_1 %in% R02_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region II (Cagayan Valley)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region III --------------------------------------------------------------

R03_list <- c("Bataan", "Bulacan", "Nueva Ecija", "Pampanga", "Tarlac", "Zambales", "Aurora")

prov_r03 <- gadm_PH1 %>%
    filter(NAME_1 %in% R03_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Code = str_replace(Code, "PH0155", "PH0371"),
              Region = "Region III (Central Luzon)",
              Province = NAME_1)

mun_r03 <- gadm_PH2 %>%
    filter(NAME_1 %in% R03_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Code = str_replace(Code, "PH0155", "PH0371"),
              Region = "Region III (Central Luzon)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region IV-A -------------------------------------------------------------

R04A_list <- c("Batangas", "Cavite", "Laguna", "Quezon", "Rizal")

prov_r04a <- gadm_PH1 %>%
    filter(NAME_1 %in% R04A_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region IV-A (CALABARZON)",
              Province = NAME_1)

mun_r04a <- gadm_PH2 %>%
    filter(NAME_1 %in% R04A_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region IV-A (CALABARZON)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region IV-B -------------------------------------------------------------

R04B_list <- c("Marinduque", "Occidental Mindoro", "Oriental Mindoro", "Palawan", "Romblon")

prov_r04b <- gadm_PH1 %>%
    filter(NAME_1 %in% R04B_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region IV-B (MIMAROPA)",
              Province = NAME_1)

mun_r04b <- gadm_PH2 %>%
    filter(NAME_1 %in% R04B_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region IV-B (MIMAROPA)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region V ----------------------------------------------------------------

R05_list <- c("Albay", "Camarines Norte", "Camarines Sur", "Catanduanes", "Masbate", "Sorsogon")

prov_r05 <- gadm_PH1 %>%
    filter(NAME_1 %in% R05_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region V (Bicol Region)",
              Province = NAME_1)

mun_r05 <- gadm_PH2 %>%
    filter(NAME_1 %in% R05_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region V (Bicol Region)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region VI ---------------------------------------------------------------

R06_list <- c("Aklan", "Antique", "Capiz", "Iloilo", "Negros Occidental", "Guimaras")

prov_r06 <- gadm_PH1 %>%
    filter(NAME_1 %in% R06_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region VI (Western Visayas)",
              Province = NAME_1)

mun_r06 <- gadm_PH2 %>%
    filter(NAME_1 %in% R06_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region VI (Western Visayas)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region VII --------------------------------------------------------------

R07_list <- c("Bohol", "Cebu", "Negros Oriental", "Siquijor")

prov_r07 <- gadm_PH1 %>%
    filter(NAME_1 %in% R07_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region VII (Central Visayas)",
              Province = NAME_1)

mun_r07 <- gadm_PH2 %>%
    filter(NAME_1 %in% R07_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region VII (Central Visayas)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region VIII -------------------------------------------------------------

R08_list <- c("Eastern Samar", "Leyte", "Northern Samar", "Samar", "Southern Leyte", "Biliran")

prov_r08 <- gadm_PH1 %>%
    filter(NAME_1 %in% R08_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region VIII (Eastern Visayas)",
              Province = NAME_1)

mun_r08 <- gadm_PH2 %>%
    filter(NAME_1 %in% R08_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region VIII (Eastern Visayas)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region IX ---------------------------------------------------------------

R09_list <- c("Zamboanga del Norte", "Zamboanga del Sur", "Zamboanga Sibugay")

mun_r09 <- gadm_PH2 %>%
    filter(NAME_2 == "Isabela City" | NAME_1 %in% R09_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region IX (Zamboanga Peninsula)",
              Province = NAME_1,
              Province = str_replace(Province, "Basilan", "City of Isabela (Not a Province)"),
              Municipality = NAME_2)

mun_r09_v2 <- gadm_PH2 %>%
    filter(NAME_1 %in% R09_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region IX (Zamboanga Peninsula)",
              Province = NAME_1,
              Province = str_replace(Province, "Basilan", "City of Isabela (Not a Province)"),
              Municipality = NAME_2)

prov_r09 <- bind_rows(
    gadm_PH1 %>%
        filter(NAME_1 %in% R09_list) %>%
        transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
                  Region = "Region IX (Zamboanga Peninsula)",
                  Province = NAME_1),
    gadm_PH2 %>%
        filter(NAME_2 == "Isabela City") %>%
        transmute(Code = str_c("PH", "0997", "00000"),
                  Region = "Region IX (Zamboanga Peninsula)",
                  Province = "City of Isabela (Not a Province)")
)

prov_r09_v2 <- gadm_PH1 %>%
    filter(NAME_1 %in% R09_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region IX (Zamboanga Peninsula)",
              Province = NAME_1)


# Region X ----------------------------------------------------------------

R10_list <- c("Bukidnon", "Camiguin", "Lanao del Norte", "Misamis Occidental", "Misamis Oriental")

prov_r10 <- gadm_PH1 %>%
    filter(NAME_1 %in% R10_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region X (Northern Mindanao)",
              Province = NAME_1)

mun_r10 <- gadm_PH2 %>%
    filter(NAME_1 %in% R10_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region X (Northern Mindanao)",
              Province = NAME_1,
              Municipality = NAME_2)


# Region XI ---------------------------------------------------------------

R11_list <- c("Davao del Norte", "Davao del Sur", "Davao Oriental", "Compostela Valley")

mun_r11 <- gadm_PH2 %>%
    filter(NAME_1 %in% R11_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region XI (Davao Region)",
              Province = NAME_1,
              Province = str_replace(Province, "Compostela Valley", "Davao de Oro"),
              Municipality = NAME_2,
              Code = case_when(Province == "Davao del Sur" & Municipality == "Don Marcelino" ~ "PH118601000",
                               Province == "Davao del Sur" & Municipality == "Jose Abad Santos" ~ "PH118602000",
                               Province == "Davao del Sur" & Municipality == "Malita" ~ "PH118603000",
                               Province == "Davao del Sur" & Municipality == "Santa Maria" ~ "PH118604000",
                               Province == "Davao del Sur" & Municipality == "Sarangani" ~ "PH118605000",
                               TRUE ~ Code),
              Province = case_when(Province == "Davao del Sur" & Municipality == "Don Marcelino" ~ "Davao Occidental",
                                   Province == "Davao del Sur" & Municipality == "Jose Abad Santos" ~ "Davao Occidental",
                                   Province == "Davao del Sur" & Municipality == "Malita" ~ "Davao Occidental",
                                   Province == "Davao del Sur" & Municipality == "Santa Maria" ~ "Davao Occidental",
                                   Province == "Davao del Sur" & Municipality == "Sarangani" ~ "Davao Occidental",
                                   TRUE ~ Province))


prov_r11 <- bind_rows(
    gadm_PH1 %>%
        filter(NAME_1 %in% R11_list & NAME_1 != "Davao del Sur") %>%
        transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
                  Region = "Region XI (Davao Region)",
                  Province = NAME_1,
                  Province = str_replace(Province, "Compostela Valley", "Davao de Oro")),
    gadm_PH2 %>%
        filter(NAME_1 == "Davao del Sur" & NAME_2 %in% c("Don Marcelino", "Jose Abad Santos", "Malita", "Santa Maria", "Sarangani")) %>%
        st_union() %>%
        tibble(Code = "PH118600000", Region = "Region XI (Davao Region)", Province = "Davao Occidental", geometry = .),
    gadm_PH2 %>%
        filter(NAME_1 == "Davao del Sur" & !(NAME_2 %in% c("Don Marcelino", "Jose Abad Santos", "Malita", "Santa Maria", "Sarangani"))) %>%
        st_union() %>%
        tibble(Code = "PH112400000", Region = "Region XI (Davao Region)", Province = "Davao del Sur", geometry = .)
)


# Region XII --------------------------------------------------------------

R12_list <- c("North Cotabato", "South Cotabato", "Sarangani", "Sultan Kudarat")

mun_r12 <- gadm_PH2 %>%
    filter(NAME_2 == "Cotabato City" | NAME_1 %in% R12_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region XII (SOCCSKSARGEN)",
              Province = NAME_1,
              Province = str_replace(Province, "Maguindanao", "City of Cotabato (Not a Province)"),
              Municipality = NAME_2)

mun_r12_v2 <- gadm_PH2 %>%
    filter(NAME_1 %in% R12_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region XII (SOCCSKSARGEN)",
              Province = NAME_1,
              Province = str_replace(Province, "Maguindanao", "City of Cotabato (Not a Province)"),
              Municipality = NAME_2)

prov_r12 <- bind_rows(
    gadm_PH1 %>%
        filter(NAME_1 %in% R12_list) %>%
        transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
                  Region = "Region XII (SOCCSKSARGEN)",
                  Province = NAME_1,
                  Province = str_remove(Province, "North ")),
    gadm_PH2 %>%
        filter(str_detect(NAME_2, "Cotabato")) %>%
        transmute(Code = str_c("PH", "1298", "00000"),
                  Region = "Region XII (SOCCSKSARGEN)",
                  Province = "City of Cotabato (Not a Province)")
)

prov_r12_v2 <- gadm_PH1 %>%
    filter(NAME_1 %in% R12_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region XII (SOCCSKSARGEN)",
              Province = NAME_1,
              Province = str_remove(Province, "North "))


# Region XIII -------------------------------------------------------------

R13_list <- c("Agusan del Norte", "Agusan del Sur", "Surigao del Norte", "Surigao del Sur", "Dinagat Islands")

prov_r13 <- gadm_PH1 %>%
    filter(NAME_1 %in% R13_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Region XIII (Caraga Region)",
              Province = NAME_1)

mun_r13 <- gadm_PH2 %>%
    filter(NAME_1 %in% R13_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Region XIII (Caraga Region)",
              Province = NAME_1,
              Municipality = NAME_2)


# CAR ---------------------------------------------------------------------

CAR_list <- c("Abra", "Benguet", "Ifugao", "Kalinga", "Mountain Province", "Apayao")

prov_car <- gadm_PH1 %>%
    filter(NAME_1 %in% CAR_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Cordillera Administrative Region (CAR)",
              Province = NAME_1)

mun_car <- gadm_PH2 %>%
    filter(NAME_1 %in% CAR_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Cordillera Administrative Region (CAR)",
              Province = NAME_1,
              Municipality = NAME_2)


# ARMM --------------------------------------------------------------------

ARMM_list <- c("Basilan", "Lanao del Sur", "Maguindanao", "Sulu", "Tawi-Tawi")

mun_armm <- gadm_PH2 %>%
    filter(NAME_1 %in% ARMM_list & !(NAME_2 %in% c("Isabela City", "Cotabato City"))) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Autonomous Region in Muslim Mindanao (ARMM)",
              Province = NAME_1,
              Municipality = NAME_2) %>%
    mutate(Code = case_when(Code == "PH158401000" ~ "PH153818000",  # Barira
                            Code == "PH158402000" ~ "PH153802000",  # Buldon
                            Code == "PH158403000" ~ "PH153830000",  # Datu Blah T. Sinsuat
                            Code == "PH158404000" ~ "PH153807000",  # Datu Odin Sinsuat
                            Code == "PH158405000" ~ "PH153814000",  # Kabuntalan
                            Code == "PH158406000" ~ "PH153809000",  # Matanog
                            Code == "PH158411000" ~ "PH153834000",  # Northern Kabuntalan
                            Code == "PH158407000" ~ "PH153811000",  # Parang
                            Code == "PH158408000" ~ "PH153812000",  # Sultan Kudarat
                            Code == "PH158409000" ~ "PH153824000",  # Sultan Mastura
                            Code == "PH158410000" ~ "PH153815000",  # Upi
                            TRUE ~ Code))

mun_armm_v2 <- gadm_PH2 %>%
    filter(NAME_1 %in% ARMM_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_2, 6, "left", "0"), "000"),
              Region = "Autonomous Region in Muslim Mindanao (ARMM)",
              Province = NAME_1,
              Municipality = NAME_2) %>%
    mutate(Code = case_when(Code == "PH158401000" ~ "PH153818000",  # Barira
                            Code == "PH158402000" ~ "PH153802000",  # Buldon
                            Code == "PH158403000" ~ "PH153830000",  # Datu Blah T. Sinsuat
                            Code == "PH158404000" ~ "PH153807000",  # Datu Odin Sinsuat
                            Code == "PH158405000" ~ "PH153814000",  # Kabuntalan
                            Code == "PH158406000" ~ "PH153809000",  # Matanog
                            Code == "PH158411000" ~ "PH153834000",  # Northern Kabuntalan
                            Code == "PH158407000" ~ "PH153811000",  # Parang
                            Code == "PH158408000" ~ "PH153812000",  # Sultan Kudarat
                            Code == "PH158409000" ~ "PH153824000",  # Sultan Mastura
                            Code == "PH158410000" ~ "PH153815000",  # Upi
                            TRUE ~ Code))

prov_armm <- bind_rows(
    gadm_PH1 %>%
        filter(NAME_1 %in% c("Lanao del Sur", "Sulu", "Tawi-Tawi")) %>%
        transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
                  Region = "Autonomous Region in Muslim Mindanao (ARMM)",
                  Province = NAME_1),
    gadm_PH2 %>%
        filter(NAME_1 == "Basilan" & NAME_2 != "Isabela City") %>%
        st_union() %>%
        tibble(Code = "PH150700000", Region = "Autonomous Region in Muslim Mindanao (ARMM)", Province = "Basilan", geometry = .),
    gadm_PH2 %>%
        filter(NAME_1 == "Maguindanao" & NAME_2 != "Cotabato City") %>%
        st_union() %>%
        tibble(Code = "PH153800000", Region = "Autonomous Region in Muslim Mindanao (ARMM)", Province = "Maguindanao", geometry = .)
)

prov_armm_v2 <- gadm_PH1 %>%
    filter(NAME_1 %in% ARMM_list) %>%
    transmute(Code = str_c("PH", str_pad(CC_1, 4, "left", "0"), "00000"),
              Region = "Autonomous Region in Muslim Mindanao (ARMM)",
              Province = NAME_1)


# Combine Regions ---------------------------------------------------------

gadm_ph_2prov <- bind_rows(
    prov_r01, prov_r02, prov_r03, prov_r04a, prov_r04b, prov_r05,
    prov_r06, prov_r07, prov_r08,
    prov_r09, prov_r10, prov_r11, prov_r12,
    prov_ncr, prov_car, prov_armm, prov_r13
)

gadm_ph_2prov_v2 <- bind_rows(
    prov_r01, prov_r02, prov_r03, prov_r04a, prov_r04b, prov_r05,
    prov_r06, prov_r07, prov_r08,
    prov_r09_v2, prov_r10, prov_r11, prov_r12_v2,
    prov_ncr, prov_car, prov_armm_v2, prov_r13
)

gadm_ph_3mun <- bind_rows(
    mun_r01, mun_r02, mun_r03, mun_r04a, mun_r04b, mun_r05,
    mun_r06, mun_r07, mun_r08,
    mun_r09, mun_r10, mun_r11, mun_r12,
    mun_ncr, mun_car, mun_armm, mun_r13
)

gadm_ph_3mun_v2 <- bind_rows(
    mun_r01, mun_r02, mun_r03, mun_r04a, mun_r04b, mun_r05,
    mun_r06, mun_r07, mun_r08,
    mun_r09_v2, mun_r10, mun_r11, mun_r12_v2,
    mun_ncr, mun_car, mun_armm_v2, mun_r13
)


# Save Shape Files as RDS -------------------------------------------------

if (!dir.exists("Shape Files/Clean/")) {
    dir.create("Shape Files/Clean/")
}

write_rds(gadm_ph_2prov, str_c("Shape Files/Clean/gadm", gadm_version, "_ph_2prov.rds"))
write_rds(gadm_ph_2prov_v2, str_c("Shape Files/Clean/gadm", gadm_version, "_ph_2prov_v2.rds"))
write_rds(gadm_ph_3mun, str_c("Shape Files/Clean/gadm", gadm_version, "_ph_3mun.rds"))
write_rds(gadm_ph_3mun_v2, str_c("Shape Files/Clean/gadm", gadm_version, "_ph_3mun_v2.rds"))


rm(list = ls())
