# PROJECT:  dsac_dataportraits
# PURPOSE:  munge user data to export to Illustrator
# AUTHOR:   A.Chafetz | USAID
# REF ID:   7a4f992d 
# LICENSE:  MIT
# DATE:     2026-02-19
# UPDATED: 

# DEPENDENCIES ------------------------------------------------------------
  
library(tidyverse)
library(googlesheets4)

# GLOBAL VARIABLES --------------------------------------------------------
  
  #Google auth
  gs4_auth()

  #google sheet id
  sheet_id <- as_sheets_id("1Efk9WuKxj_tN8dhWQj2JRURYnQAFfjqjL1-EDwGicc4")
  
  #graphic format
  format <- "svg"
  
# IMPORT ------------------------------------------------------------------
  
  #read in data collected from Google Form
  df <- read_sheet(sheet_id)
  
# MUNGE -------------------------------------------------------------------

  #clean column names
  set_col_names <- c('timestamp',
                     'name',
                     'email',
                     'role',
                     'location',
                     'years',
                     'value',
                     'rhythm',
                     'hobbies')
  
  #rename columsn for Illustrator
  names(df) <- set_col_names
  
  #remove extra cols
  df_dp <- df %>% 
    select(-timestamp, -email)

  #clean role
  # list.files("images", "role")
  df_dp <- df_dp %>% 
    mutate(role = role %>%
             str_replace_all(" ", "-") %>% 
             tolower(),
           role = str_glue("role_{role}.{format}"))
  
  #clean location
  # list.files("images", "loc")
  df_dp <- df_dp %>% 
    mutate(location = location %>%
             str_replace_all(" ", "-") %>% 
             tolower(),
           location = str_glue("dp_loc_{location}.{format}"))
  
  #clean years
  # list.files("images","years")
  df_dp <- df_dp %>% 
    mutate(years = ifelse(years < 10, paste0("0", years), years),
           years = str_glue("dp_years_{years}.{format}"))
  
  #clean values
  # list.files("images", "values")
  df_dp <- df_dp %>% 
    mutate(value = str_extract(tolower(value), "(imact|inclusion|listen|open|resilience)"),
           value = str_glue("dp_value_{value}.{format}"))
  
  #clean values
  # list.files("images", "rhythm")
  df_dp <- df_dp %>% 
    mutate(rhythm = str_extract(tolower(rhythm), "(focus|collab|mix|wherever)"),
           rhythm = str_glue("dp_rhythm_{rhythm}.{format}"))
  
  #create individual hobby columns
  df_dp <- df_dp %>% 
    mutate(
      hobby_creative = case_when(str_detect(hobbies, "Creative") ~ "X"),
      hobby_social = case_when(str_detect(hobbies, "Social") ~ "X"),
      hobby_physical = case_when(str_detect(hobbies, "Physical") ~ "X"),
      hobby_collect = case_when(str_detect(hobbies, "Collecting") ~ "X"),
      hobby_mental = case_when(str_detect(hobbies, "Mental") ~ "X"),
    ) %>% 
    select(-hobbies)

  
  #rename cols for use in illustrator
  df_dp <- df_dp %>% 
    rename_with(
      ~ paste0("@", .x),
      .cols = c(role, location, years, value, rhythm)
    ) %>% 
    rename_with(
      ~ paste0("#", .x),
      starts_with("hobby"),
    )

# EXPORT ------------------------------------------------------------------

  write_csv(df_dp, 
            "Data/dsac_portraits.csv",
            na = "")







