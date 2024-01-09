
# Bereite einen Eurostat-Datensatz auf
prep_data <- function (data, normalize = NULL) {

    if (!is.null(normalize)) {
        base <- read_xlsx(normalize)
        joined <- left_join(data, base, by = "geo")
        xs <- joined %>% select(matches("[0-9]{4}.x$"))
        ys <- joined %>% select(matches("[0-9]{4}.y$"))
        info <- joined %>% select(!matches("[0-9]{4}.x$|[0-9]{4}.y$")) %>% select(!matches("[0-9]{4}"))
        norms <- xs / ys
        names(norms) <- names(norms) %>% str_remove(".x$")
        data <- cbind(info, norms) %>% as.data.frame()
    }

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
read_data <- function (name, normalize = NULL) {
    read_xlsx(path = paste0("Daten/", name, ".xlsx")) %>% prep_data(normalize = glue("Daten/{normalize}.xlsx"))
}

