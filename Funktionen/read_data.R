
cntr_code <- c("EE", "LV", "LT", "PL", "CZ", "SK", "HU", "RO", "RS", "HR", "SI", "AL", "BG")

# Bereite einen Eurostat-Datensatz auf
prep_data <- function (data) {

    prepData <- data %>%
      # Zerlege geo in NUTS Variablen
      mutate(
        .after = geo,
        nuts0 = if_else(nchar(geo) >= 2, geo %>% str_extract(pattern = "^.."), NA),
        nuts1 = if_else(nchar(geo) >= 3, geo %>% str_extract(pattern = "^..."), NA),
        nuts2 = if_else(nchar(geo) >= 4, geo %>% str_extract(pattern = "^...."), NA),
      ) %>%
      # Filtere nach Ländern + Sachsen
      filter(nuts0 %in% cntr_code | nuts1 == "DED") %>%
      # Füge die Geometrie hinzu
      left_join(shape_nuts %>% select(NUTS_ID), by = c("geo" = "NUTS_ID")) %>%
      # Korrigiere doppelte NUTS-Zuordnungen
      mutate(
        nuts0 = if_else(is.na(nuts1) & is.na(nuts2), nuts0, NA),
        nuts1 = if_else(is.na(nuts0) & is.na(nuts2), nuts1, NA)
      )

    # Ändere Klasse zu sf
    geom_data <- st_as_sf(prepData, sf_column_name = "geometry")

    return(geom_data)
}

# Lese einen Eurostat Datensatz ein und bereite ihn auf
read_data <- function (name) {
    read_xlsx(path = paste0("Daten/", name, ".xlsx")) %>% prep_data()
}

