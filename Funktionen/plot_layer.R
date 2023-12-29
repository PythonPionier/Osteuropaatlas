# Geometrie für die Hauptstädte
NAME <- c("Dresden", "Tallinn", "Riga", "Vilnius", "Warschau", "Prag", "Bratislava", "Budapest", "Bukarest", "Belgrad", "Zagreb", "Ljubljana", "Tirana", "Sofia")
LAT <- c(51.0504, 59.4372155, 56.9493977, 54.6870458, 52.2337172, 50.0874654, 48.1516988, 47.4978918, 44.4361414, 44.8178131, 45.8426414, 46.0500268, 41.3281482, 42.6977028)
LON <- c(13.7373, 24.7453688, 24.1051846, 25.2829111, 21.0714322, 14.4212535, 17.1093063, 19.0401609, 26.1027202, 20.4568974, 15.9622315, 14.5069289, 19.8184435, 23.3217359)
geom_cap <- data.frame(NAME, LAT, LON) %>% st_as_sf(coords = c("LON", "LAT"), crs = st_crs(shape_nuts))

# Geometrie für die Grenzen
geom_grenzen <- shape_nuts %>% filter(NUTS_ID %in% cntr_code | NUTS_ID == "DED") %>% select(NUTS_ID)
geom_welt <- shape_world %>% st_transform(crs = st_crs(geom_grenzen))
box <- st_bbox(geom_grenzen)

# Laden einer Mono Schriftart für die Legende: dpi hier muss dpi in ggsave entsprechen!
font_add_google(name = "Roboto Mono", family = "my_mono")
showtext_auto()
showtext_opts(dpi = 300)

# Plotten eines Layers
plot_layer <- function(layer) {
    ggplot() +
      geom_sf(data = geom_welt) +
      layer +
      geom_sf(data = geom_grenzen, color = "black", lwd = unit(x = .5, units = "pt"), fill = NA) +
      geom_sf(data = geom_cap, shape = 21, color = "black", fill = "#92BF00") +
      coord_sf(xlim = c(box[1], box[3]), ylim = c(box[2], box[4])) +
      im_gg_theme() +
      theme(
        legend.position = c(.007, .9957),
        legend.justification = c("left", "top"),
        legend.text.align = 1,
        legend.text = element_text(family = "mono"),
        legend.box.background = element_rect(color = "black", linewidth = unit(1.5, "pt")),
        legend.key.size = unit(x = 12, units = "pt"),
        panel.border = element_rect(colour = "black", fill = NA, linewidth = unit(1.75, "pt")),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.line = element_blank(),
        plot.margin = margin(t = 0, r = 0, b = 0,l = 0),
        panel.background = element_blank(),
        plot.background = element_blank()
      )
}
