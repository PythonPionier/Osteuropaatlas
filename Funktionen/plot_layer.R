
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
        plot.margin = margin(t = 0, b = 0),
        panel.background = element_blank(),
        plot.background = element_blank()
      )
}

