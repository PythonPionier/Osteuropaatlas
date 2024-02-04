
library(imregr)
library(ggrepel)
setwd("C:/Users/sgraefe/Desktop/Osteuropaatlas/Abbildungen")


# Geometrie für die Grenzen
cntr_code <- c("EE", "LV", "LT", "PL", "CZ", "SK", "HU", "RO", "HR", "SI", "BG")
geom_grenzen <- shape_nuts %>% filter(NUTS_ID %in% cntr_code | NUTS_ID == "DED") %>% select(NUTS_ID)
geom_nuts <- shape_nuts %>% filter(CNTR_CODE %in% cntr_code | NUTS_ID %in% c("DED2","DED4","DED5")) %>% filter(str_length(NUTS_ID)==4) %>% select(NUTS_ID)
geom_welt <- shape_world %>% st_transform(crs = st_crs(geom_grenzen))
box <- st_bbox(geom_grenzen)

center <- st_centroid(geom_nuts) %>% st_coordinates() %>% data.frame()
labels <- cbind(geom_nuts %>% st_drop_geometry(), center)

ggplot() +
  geom_sf(data = geom_welt) +
  geom_sf(data = geom_nuts, fill = im_col("imreg", .8)) +
  geom_sf(data = geom_grenzen, color = "black", lwd = unit(x = .5, units = "pt"), fill = NA) +
  geom_label_repel(data = labels, aes(label=NUTS_ID, x=X, y=Y), label.size = 0) +
  coord_sf(xlim = c(box[1], box[3]), ylim = c(box[2], box[4])) +
  xlab("") + ylab("") +
  im_gg_theme() +
  theme(
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    axis.line = element_blank(),
    plot.margin = margin(t = 0, b = 0),
    panel.background = element_blank(),
    plot.background = element_blank(),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = unit(1.75, "pt"))
  )

ggsave("NUTS_Systematik.png", width = 17.0637506917, height = 22, units = "cm")