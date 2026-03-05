# PROJECT:  dsac_dataportraits
# PURPOSE:  generate a dummy dataset for testing
# AUTHOR:   A.Chafetz | CMS
# REF ID:   cca09635 
# LICENSE:  CC0
# DATE:     2026-02-19
# UPDATED:  2026-03-05

# DEPENDENCIES ------------------------------------------------------------
  
  library(tidyverse)
  library(clipr)
  library(googledrive)

# GLOBAL VARIABLES --------------------------------------------------------


  #google sheets id
  sheet_id <- as_id("1Efk9WuKxj_tN8dhWQj2JRURYnQAFfjqjL1-EDwGicc4")
  
  #sample size 
  n <- 25
  

# QUESTION POSSIBLE ANSWERS -----------------------------------------------

  opts_role <- c("Engineer", "Designer", "Product Manager", "Data Scientist", "Front Office")
  opts_location <- c("Atlanta", "Baltimore", "Boston", "Chicago", "DC", "Dallas", "Denver", "Kansas City", "New York", "Philadelphia", "San Francisco", "Seattle")
  opts_years <- 1:15
  opts_start <- 2022:2026
  opts_value <- c("Embrace inclusion", "Listen first", "Work Open", "Amplify Impact", "Champion Resilience")
  opts_rhythm <- c("Deep focus blocks with minimal interruptions", "Collaborative sessions with the team", "A mix of solo and group work", "Wherever the day takes me")
  opts_hobbies <- c("Physical: Body-focused activities (sports, hiking, yoga, birdwatching)", "Creative: Making/expressing (art, music, crafts, woodworking, cooking)", "Social: People-centered (performance, volunteering, clubs, team sports)", "Mental: Mind-focused (puzzles, reading, learning, games)", "Collecting: Acquisition and curation")
  
  
# CREATE SAMPLE DATASET ---------------------------------------------------

  # set seed (reproducibility)
  set.seed(42)

  # Create dummy data to match Google Form collection
  dsac_survey <- tibble(
    timestamp = now(),
    name = sample(fruit, n) %>% str_to_title(),
    email = paste0(tolower(name), ".fruit@cms.hhs.gov"),
    role = sample(opts_role, n, replace = TRUE),
    start = sample(opts_start, n, replace = TRUE),
    location = sample(opts_location, n, replace = TRUE),
    years = sample(opts_years, n, replace = TRUE),
    value = sample(opts_value, n, replace = TRUE),
    rhythm = sample(opts_rhythm, n, replace = TRUE),
    # Hobbies: randomly select 0-3 hobbies per person
    hobbies = map_chr(1:n, function(x) {
      n_hobbies <- sample(1:3, 1)
      selected <- sample(opts_hobbies, n_hobbies, replace = FALSE)
      paste(sort(selected), collapse = ",")
    })
  )
  
  # review
  glimpse(dsac_survey)

# EXPORT ------------------------------------------------------------------

  #copy to clipboard and paste into Google Sheet for testing
  write_clip(dsac_survey, col.names = FALSE)
  
  #launch sheet
  drive_browse(sheet_id)
