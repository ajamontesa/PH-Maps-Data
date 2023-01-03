if (dir.exists("Data") == FALSE) {
    dir.create("Data")
}

if (dir.exists("Shape Files") == FALSE) {
    dir.create("Shape Files")
}


# Download GADM Shape Files (Version 4.1) ---------------------------------


download.file(url = "https://geodata.ucdavis.edu/gadm/gadm4.1/shp/gadm41_PHL_shp.zip",
              method = "libcurl",
              destfile = "Shape Files/gadm41_PHL_shp.zip")



# Unzip Downloaded Shape Files --------------------------------------------

unzip(zipfile = "Shape Files/gadm41_PHL_shp.zip", exdir = "Shape Files/gadm41_PHL_shp")
