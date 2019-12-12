cylinder_bands <- read.csv("cylinder_bands.csv", stringsAsFactors = FALSE)
str(cylinder_bands)


cylinder_bands$cylinder_number <- toupper(cylinder_bands$cylinder_number)
cylinder_bands$customer <- toupper(cylinder_bands$customer)
cylinder_bands$grain_screened <- toupper(cylinder_bands$grain_screened)
cylinder_bands$ink_color <- toupper(cylinder_bands$ink_color)
cylinder_bands$proof_ink <- toupper(cylinder_bands$proof_ink)
cylinder_bands$blade_mg <- toupper(cylinder_bands$blade_mg)
cylinder_bands$cylinder_div <- toupper(cylinder_bands$cylinder_div)
cylinder_bands$paper_type <- toupper(cylinder_bands$paper_type)
cylinder_bands$ink_type <- toupper(cylinder_bands$ink_type)
cylinder_bands$ddirect_steam <- toupper(cylinder_bands$direct_steam)
cylinder_bands$solvent_type <- toupper(cylinder_bands$solvent_type)
cylinder_bands$type_on_cylinder <- toupper(cylinder_bands$type_on_cylinder)
cylinder_bands$press_type <- toupper(cylinder_bands$press_type)
cylinder_bands$cylinder_size <- toupper(cylinder_bands$cylinder_size)
cylinder_bands$paper_mill_location <- toupper(cylinder_bands$paper_mill_location)
cylinder_bands$band_type <- toupper(cylinder_bands$band_type)

# get rid of "?"
cylinder_bands[cylinder_bands == "?"] <- ""
cylinder_bands[is.na(cylinder_bands)] <- ""
tail(cylinder_bands)


# =============================================================================================
# Categorical Data
# =============================================================================================

# creating new variables for categories
cylinder_bands$cblade_mfg <- cylinder_bands$blade_mg # 3 cat: benton, daetwyler, uddeholm
cylinder_bands$ccyl_div <- cylinder_bands$cylinder_div # 3 cat: gallatin, warsaw, matoon
cylinder_bands$cpaper_type <- cylinder_bands$paper_type # 3 cat: uncoated, coated, super
cylinder_bands$cink_type <- cylinder_bands$ink_type # 3 cat: uncoated, coated, cover
cylinder_bands$csol_type <- cylinder_bands$solvent_type # 5 cat: xylol, lactol, naptha, line, other
cylinder_bands$cpress_type <- cylinder_bands$press_type # 4 cat: 70 motter, 70 wood hoe, 70 albert, 94 motter
cylinder_bands$ccyl_size <- cylinder_bands$cylinder_size # 2 cat: spiegel, tabloid
cylinder_bands$cpaper_mill <- cylinder_bands$paper_mill_location # 5 cat: north us, south us, canadian, scandanavian, mid european

str(cylinder_bands)
# loop for blade # 3 cat: benton, daetwyler, uddeholm
cylinder_bands$cblade_mfg <- gsub("BENTON", "1", cylinder_bands$cblade_mfg)
cylinder_bands$cblade_mfg <- gsub("DAETWYLER", "2", cylinder_bands$cblade_mfg)
cylinder_bands$cblade_mfg <- gsub("UDDEHOLM", "3", cylinder_bands$cblade_mfg)
# loop for cyl_div # 3 cat: gallatin, warsaw, matoon
cylinder_bands$ccyl_div <- gsub("GALLATIN", "1", cylinder_bands$ccyl_div)
cylinder_bands$ccyl_div <- gsub("WARSAW", "2", cylinder_bands$ccyl_div)
cylinder_bands$ccyl_div <- gsub("MATOON", "3", cylinder_bands$ccyl_div)
# loop for paper_type # 3 cat: uncoated, coated, super
cylinder_bands$cpaper_type <- gsub("UNCOATED", "2", cylinder_bands$cpaper_type)
cylinder_bands$cpaper_type <- gsub("COATED", "1", cylinder_bands$cpaper_type)
cylinder_bands$cpaper_type <- gsub("SUPER", "3", cylinder_bands$cpaper_type)
# loop for ink_type # 3 cat: uncoated, coated, cover
cylinder_bands$cink_type <- gsub("UNCOATED", "2", cylinder_bands$cink_type)
cylinder_bands$cink_type <- gsub("COATED", "1", cylinder_bands$cink_type)
cylinder_bands$cink_type <- gsub("COVER", "3", cylinder_bands$cink_type)
# loop for solvent_type # 5 cat: xylol, lactol, naptha, line, other
cylinder_bands$csol_type <- gsub("XYLOL", "1", cylinder_bands$csol_type)
cylinder_bands$csol_type <- gsub("LACTOL", "2", cylinder_bands$csol_type)
cylinder_bands$csol_type <- gsub("NAPTHA", "3", cylinder_bands$csol_type)
cylinder_bands$csol_type <- gsub("LINE", "4", cylinder_bands$csol_type)
cylinder_bands$csol_type <- gsub("OTHER", "5", cylinder_bands$csol_type)
# loop for press_type # 4 cat: 70 motter, 70 wood hoe, 70 albert, 94 motter
cylinder_bands$cpress_type <- gsub("MOTTER70", "1", cylinder_bands$cpress_type)
cylinder_bands$cpress_type <- gsub("MOTTER94", "2", cylinder_bands$cpress_type)
cylinder_bands$cpress_type <- gsub("WOODHOE70", "3", cylinder_bands$cpress_type)
cylinder_bands$cpress_type <- gsub("ALBERT70", "4", cylinder_bands$cpress_type)
# loop for cyl_size # 2 cat: spiegel, tabloid
cylinder_bands$ccyl_size <- gsub("SPIEGEL", "1", cylinder_bands$ccyl_size)
cylinder_bands$ccyl_size <- gsub("TABLOID", "2", cylinder_bands$ccyl_size)
cylinder_bands$ccyl_size <- gsub("CATALOG", "3", cylinder_bands$ccyl_size)
# loop for papermill # 5 cat: north us, south us, canadian, scandanavian, mid european
cylinder_bands$cpaper_mill <- gsub("NORTHUS", "1", cylinder_bands$cpaper_mill)
cylinder_bands$cpaper_mill <- gsub("SOUTHUS", "2", cylinder_bands$cpaper_mill)
cylinder_bands$cpaper_mill <- gsub("CANADIAN", "3", cylinder_bands$cpaper_mill)
cylinder_bands$cpaper_mill <- gsub("SCANDANAVIAN", "4", cylinder_bands$cpaper_mill)
cylinder_bands$cpaper_mill <- gsub("MIDEUROPEAN", "5", cylinder_bands$cpaper_mill)
