# PROJECT:  dsac_dataportraits
# PURPOSE:  upload data files
# AUTHOR:   A.Chafetz | CMS
# REF ID:   2e09fd75 
# LICENSE:  MIT
# DATE:     2026-03-05
# UPDATED: 

# DEPENDENCIES ------------------------------------------------------------
  
  #general
  library(tidyverse)
  library(googledrive)
    

# GLOBAL VARIABLES --------------------------------------------------------
  
  fldr_parent <- as_id("https://drive.google.com/drive/folders/1gFboFBMVZXov392Q7MAvFRJXIFXROjLt")
  
  fldr_nm <- "2026 Data Portraits"

# FOLDER ADMIN ------------------------------------------------------------

  #create a folder (only run the first time)
  drive_mkdir(fldr_nm,fldr_parent, overwrite = FALSE)
  
  #grab the gs id to upload to
  fldr_id <- drive_ls(fldr_parent, fldr_nm) %>% pull(id)


# UPLOAD FILES ------------------------------------------------------------

  #list out files
  files <- list.files("Images", full.names = TRUE)
  
  #upload each to Gdrive
  map(files,
      ~ drive_upload(
        .x,
        path = fldr_id,
        name = basename(.x),
        overwrite = TRUE)
  )
  
  #launch folder
  drive_browse(fldr_id)
