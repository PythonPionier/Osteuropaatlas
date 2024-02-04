
# Funktion zum Erstellen und Speichern der Karten: Erwartet die Variablen 'value' und 'delta'
plot_map <- function (data, name, unit) {

    # Erstellen der Legendenbeschriftung
    nuts2_data <- data %>% st_drop_geometry() %>% filter(!is.na(nuts2))
    if(nrow(nuts2_data) == 0) nuts2_data <- data %>% st_drop_geometry() %>% filter(!is.na(nuts3))
    val_breaks <- nuts2_data %>% select(value) %>% unlist() %>% remove_outliers() %>% find_breaks()
    val_labs <- val_breaks %>% create_labels(unit)
    del_breaks <- nuts2_data %>% select(delta) %>% unlist() %>% remove_outliers() %>% find_breaks()
    del_labs <- del_breaks %>% create_labels("%", delta = T)

    # Erstellen der Füllwerte
    plotframe <- data %>% mutate(
        val_fill = cut(value, breaks = c(-Inf, val_breaks, Inf), labels = val_labs, ordered_result = T) %>% fct_rev(),
        del_fill = cut(delta, breaks = c(-Inf, del_breaks, Inf), labels = del_labs, ordered_result = T) %>% fct_rev()
    )

    # Erstellen der 'value' Liste: 1. NUTS2, 2. NUTS0, 3. NUTS1, 4. NUTS2
    val_layer <- list(
      geom_sf(data = plotframe %>% filter(!is.na(nuts2)), aes(fill = val_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts0)), aes(fill = val_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts1)), aes(fill = val_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts2)), aes(fill = val_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts3)), aes(fill = val_fill)),
      scale_fill_manual(name = NULL, values = fill_cols(val_breaks), na.translate = FALSE, limits = rev(val_labs))
    )

    # Erstellen der 'delta' Liste: 1. NUTS2, 2. NUTS0, 3. NUTS1, 4. NUTS2
    del_layer <- list(
      geom_sf(data = plotframe %>% filter(!is.na(nuts2)), aes(fill = del_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts0)), aes(fill = del_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts1)), aes(fill = del_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts2)), aes(fill = del_fill)),
      geom_sf(data = plotframe %>% filter(!is.na(nuts3)), aes(fill = del_fill)),
      scale_fill_manual(name = NULL, values = fill_cols(del_breaks), na.translate = FALSE, limits = rev(del_labs))
    )

    # Erstellen der Plots
    value_plot <- plot_layer(val_layer)
    delta_plot <- plot_layer(del_layer)
    grid.arrange(value_plot, delta_plot, ncol = 2)

    # Speichern der Plots
    glue("Speichere Karten {name} & {name}_Delta...") %>% print()
    ggsave(glue("Karten/{name}.png"), value_plot, dpi = 300, height = 172, width = 104.08897775, units = "mm")
    ggsave(glue("Karten/{name}_Delta.png"), delta_plot, dpi = 300, height = 172, width = 104.08897775, units = "mm")
    print("...fertig!")
}
